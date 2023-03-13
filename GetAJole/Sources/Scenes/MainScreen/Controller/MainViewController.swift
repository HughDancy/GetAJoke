//
//  ViewController.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Subview's
    
    private var mainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }
    
    var joke = Joke()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Button's Action


}

