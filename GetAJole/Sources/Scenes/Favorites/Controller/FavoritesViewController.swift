//
//  FavoritesViewController.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit

final class FavoritesViewController: UIViewController {
    // MARK: - Propertie's
    var databaseManager: FavoritesDatabaseProtocol?
    private var isScrollToTop = false
    private var lastVelocityYSign = 0

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
        self.setupView()
        self.setupTabBar()
    }
    
    // MARK: - Setup View
    private func setupView() {
        let favoritesView = FavoritesView()
        favoritesView.favoritesTableView.delegate = self
        favoritesView.favoritesTableView.dataSource = self
        view = favoritesView
    }
    
    // MARK: - Setup TabBar edge inset
    private func setupTabBar() {
        let tabBarHeight = CGFloat(49)
        edgesForExtendedLayout = UIRectEdge.all
        mainView?.favoritesTableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: tabBarHeight, right: 0.0)
    }
}

    // MARK: - TableView Extension
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FavoriteHeader.reuseIdentifier) as? FavoriteHeader else {
            return UITableViewHeaderFooterView() }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        78
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let jokes = databaseManager?.getSavedJokes()
        return jokes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesCell.reusableIdentifier, for: indexPath) as? FavoritesCell else { return UITableViewCell() }
        let model = databaseManager?.getSavedJokes()
        cell.setupCell(number: indexPath.row, setup: model?[indexPath.row].setup ?? "", punch: model?[indexPath.row].punchline ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = TableViewAnimator.makeMoveUpWithFadeAnimation(rowHeight: 150, duration: 0.85, delayFactor: 0.02)
        let animator = TableViewAnimator(animation: animation)
        if self.isScrollToTop == false {
            animator.animate(cell: cell, at: indexPath, in: tableView)
        }
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
            -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, _ in
                tableView.dataSource?.tableView?(tableView, commit: .delete, forRowAt: indexPath)

            }
            deleteAction.image = UIImage(named: "trash")
            deleteAction.backgroundColor = .systemGray5
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let allJokes = self.databaseManager?.getSavedJokes()
            guard let deletedJoke = allJokes?[indexPath.row] else { return }
            self.databaseManager?.deleteJoke(deletedJoke)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .right)
            tableView.endUpdates()
        }
    }


}

    // MARK: - Extenstion for animation
extension FavoritesViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentVelocityY =  scrollView.panGestureRecognizer.velocity(in: scrollView.superview).y
        let currentVelocityYSign = Int(currentVelocityY).signum()
        if currentVelocityYSign != lastVelocityYSign &&
            currentVelocityYSign != 0 {
            lastVelocityYSign = currentVelocityYSign
        }
        if lastVelocityYSign < 0 {
            self.isScrollToTop = false
        } else if lastVelocityYSign > 0 {
            self.isScrollToTop = true
        }
    }
}
