//
//  FavoriteHeader.swift
//  GetAJole
//
//  Created by Борис Киселев on 06.09.2024.
//

import UIKit

final class FavoriteHeader: UITableViewHeaderFooterView {
    static let reuseIdentifier = "FavoriteHeader"

    // MARK: - Outlets
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Noteworthy-Bold", size: 35)
        label.textColor = .label
        label.text = "Favorite Jokes"
        return label
    }()

    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Common Init
    private func commonInit() {
        self.backgroundColor = .none
        self.contentView.backgroundColor = .clear
        contentView.addSubview(title)
        setupLayout()
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
