//
//  FavoritesViewController.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    // MARK: - Subview's
    private var mainView: FavoritesView? {
        guard isViewLoaded else { return nil }
        return view as? FavoritesView
    }
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        mainView?.favoritesTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = FavoritesView()
    }
}
