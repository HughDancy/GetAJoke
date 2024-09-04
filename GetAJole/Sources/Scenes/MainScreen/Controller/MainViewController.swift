//
//  ViewController.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let cache = Cache<String, String>()

    // MARK: - Subview's
    private var mainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }
    
    lazy var dataBaseManager: DataBaseSavingProtocol = MainScreenDataBaseManager()
    lazy var networkManager: MainScreenNetworkManagerProtocol = MainScreenNetworkManager()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
        mainView?.getJokeButton.addTarget(self, action: #selector(getJoke), for: .touchDown)
        mainView?.getToFavoriteButton.addTarget(self, action: #selector(saveJoke), for: .touchDown)
    }
    
    // MARK: - Button's Action
    @objc func getJoke() {
        networkManager.getRandomJoke { [weak self] joke in
            self?.updateCache(setup: joke.setup, punchline: joke.punchline)
            DispatchQueue.main.async {
                self?.mainView?.setupLabel.setTyping(text: "\(joke.setup) \n \(joke.punchline)")
            }
        }
    }
    
    @objc func saveJoke() {
        let setup = self.cache.value(forKey: CacheKeys.setup.rawValue)
        let punchline = self.cache.value(forKey: CacheKeys.punchline.rawValue)
        dataBaseManager.saveJoke(setup: setup ?? "", punch: punchline ?? "")
    }

    private func updateCache(setup: String, punchline: String) {
        self.cache.remove(forKey: CacheKeys.setup.rawValue)
        self.cache.remove(forKey: CacheKeys.punchline.rawValue)
        self.cache.insert(setup, forKey: CacheKeys.setup.rawValue)
        self.cache.insert(punchline, forKey: CacheKeys.punchline.rawValue)
    }
}

private enum CacheKeys: String {
    case setup = "Setup"
    case punchline = "Punchline"
}

