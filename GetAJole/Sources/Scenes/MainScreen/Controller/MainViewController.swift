//
//  ViewController.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private var setup = ""
    private var punch = ""

    // MARK: - Subview's
    private var mainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }
    
    lazy var dataBaseManager: DataBaseSavingProtocol = MainScreenDataBaseManager()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
        mainView?.getJokeButton.addTarget(self, action: #selector(getJoke), for: .touchDown)
        mainView?.getToFavoriteButton.addTarget(self, action: #selector(saveJoke), for: .touchDown)
    }
    
    // MARK: - Button's Action
    @objc func getJoke() {
        let request = AF.request("https://official-joke-api.appspot.com/jokes/random")
        request.responseDecodable(of: Joke.self) { data in
            guard let randomJoke = data.value else { return }
            self.setup = randomJoke.setup
            self.punch = randomJoke.punchline
            
            DispatchQueue.main.async {
                self.mainView?.setupLabel.setTyping(text: "\(randomJoke.setup) \n \(randomJoke.punchline)")
            }
        }
    }
    
    @objc func saveJoke() {
        dataBaseManager.saveJoke(setup: self.setup, punch: self.punch)
    }
}

