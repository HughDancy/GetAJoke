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
    
    let label = createFavoriteLabel(with: "Favorite Jokes", size: 35)

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
        addSubview(label)
        addSubview(favoritesTableView)
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.centerX.equalToSuperview()
            make.height.equalTo(37)
        }

        favoritesTableView.snp.makeConstraints { make in
            make.top.equalTo(label).inset(45)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(35)
        }
    }
}


