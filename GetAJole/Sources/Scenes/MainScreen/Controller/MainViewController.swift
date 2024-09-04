//
//  ViewController.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private var setup: String = ""
    private var punch = ""

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
            self?.setup = joke.setup
            self?.punch = joke.punchline
            DispatchQueue.main.async {
                self?.mainView?.setupLabel.setTyping(text: "\(joke.setup) \n \(joke.punchline)")
            }
        }
    }
    
    @objc func saveJoke() {
        dataBaseManager.saveJoke(setup: self.setup, punch: self.punch)
    }
}

