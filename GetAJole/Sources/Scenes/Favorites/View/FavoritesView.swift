//
//  FavoritesView.swift
//  GetAJole
//
//  Created by Борис Киселев on 14.03.2023.
//

import UIKit
import SnapKit
import Realm
import RealmSwift

class FavoritesView: UIView {
    
    //MARK: - Subview
    
    var model: Results<Joke> = {
        let realm = try! Realm()
        return realm.objects(Joke.self)
    }()
    
    let favoritesTableView = createFavoritesTableView()
    let label = createFavoriteLabel(with: "Favorite Jokes", size: 35)
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Hierarchy
    
    private func setupHierarchy() {
        addSubview(label)
        addSubview(favoritesTableView)
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.centerX.equalToSuperview()
            make.height.equalTo(37)
        }
        
        favoritesTableView.snp.makeConstraints { make in
            make.top.equalTo(label).inset(45)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

//MARK: - TableView Extension

extension FavoritesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell", for: indexPath) as! FavoritesCell
        cell.setupLabel.text = model[indexPath.row].setup
        cell.punchLabel.text = model[indexPath.row].punchline
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = makeMoveUpWithFadeAnimation(rowHeight: 150, duration: 0.85, delayFactor: 0.02)
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}

