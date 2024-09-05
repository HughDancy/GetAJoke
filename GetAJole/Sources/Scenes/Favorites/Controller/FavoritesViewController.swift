//
//  FavoritesViewController.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit

class FavoritesViewController: UIViewController {

    var databaseManager: FavoritesDatabaseProtocol?

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
        let favoritesView = FavoritesView()
        favoritesView.favoritesTableView.delegate = self
        favoritesView.favoritesTableView.dataSource = self
        view = favoritesView
    }
}

// MARK: - TableView Extension
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let jokes = databaseManager?.getSavedJokes()
        return jokes?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell", for: indexPath) as? FavoritesCell else { return UITableViewCell() }
        let model = databaseManager?.getSavedJokes()
        cell.setupCell(number: indexPath.row, setup: model?[indexPath.row].setup ?? "", punch: model?[indexPath.row].punchline ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = makeMoveUpWithFadeAnimation(rowHeight: 150, duration: 0.85, delayFactor: 0.02)
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}
