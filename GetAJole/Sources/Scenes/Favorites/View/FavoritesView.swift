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
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemGray6
        addSubview(favoritesTableView)
        setupLayout()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        
        favoritesTableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
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
    
    
}

