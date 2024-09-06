//
//  FavoritesView.swift
//  GetAJole
//
//  Created by Борис Киселев on 14.03.2023.
//

import UIKit
import SnapKit

class FavoritesView: UIView {

    // MARK: - Subview
    let favoritesTableView = FavoritesTable()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemGray5
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Hierarchy
    private func setupHierarchy() {
        addSubview(favoritesTableView)
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        favoritesTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}


