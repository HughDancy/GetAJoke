//
//  ViewController.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit
import Alamofire
import Realm
import RealmSwift

class MainViewController: UIViewController {
    
    //MARK: - Subview's
    
    private var mainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }
    
    var temponary = Temp(setup: "", punch: "")
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
        mainView?.getJokeButton.addTarget(self, action: #selector(getJoke), for: .touchDown)
        mainView?.getToFavoriteButton.addTarget(self, action: #selector(saveJoke), for: .touchDown)
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Button's Action
    
    @objc func getJoke() {
        let request = AF.request("https://official-joke-api.appspot.com/jokes/random")
        request.responseDecodable(of: Joke.self) { data in
            guard let randomJoke = data.value else { return }
        
            self.temponary.setup = randomJoke.setup
            self.temponary.punch = randomJoke.punchline
            
            DispatchQueue.main.async {
                self.mainView?.setupLabel.text = randomJoke.setup
                self.mainView?.punchLabel.text = randomJoke.punchline
            }
        }
    }
    
    @objc func saveJoke() {
        
        let joker = Joke()
        joker.setup =  self.temponary.setup
        joker.punchline = self.temponary.punch
        
        let realm = try! Realm()
        
        try! realm.write({
            realm.add(joker)
        })
        
        for i in realm.objects(Joke.self) {
            print(i)
        }
    }

}

