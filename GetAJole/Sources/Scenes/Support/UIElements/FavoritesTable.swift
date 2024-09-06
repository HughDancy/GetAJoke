//
//  FavoritesTable.swift
//  GetAJole
//
//  Created by Борис Киселев on 06.09.2024.
//

import UIKit
final class FavoritesTable: UITableView {
    // MARK: - Init
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        self.setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup TableView
    private func setupTableView() {
        self.backgroundColor = .systemGray5
        self.showsVerticalScrollIndicator = false
        self.register(FavoritesCell.self, forCellReuseIdentifier: FavoritesCell.reusableIdentifier)
        self.separatorStyle = .none
    }
}


