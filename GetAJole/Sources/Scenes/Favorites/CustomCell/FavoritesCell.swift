//
//  FavoritesCell.swift
//  GetAJole
//
//  Created by Борис Киселев on 14.03.2023.
//

import UIKit
import SnapKit

final class FavoritesCell: UITableViewCell {
    static let reusableIdentifier = "FavoritesCell"

    // MARK: - Subview's
    private let baseView = createBackView(cornerRadius: 20)
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Marker Felt Thin", size: 20)
        return label
    }()
    private let setupLabel = createSimpleLabel(with: "Test", size: 20)
    private let punchLabel = createSimpleLabel(with: "Simple", size: 20)

    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "favoritesCell")
        self.backgroundColor = .systemGray5
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        self.setupLabel.text = nil
        self.numberLabel.text = nil
        self.punchLabel.text = nil
    }

    // MARK: - Setup Hierarchy
    private func setupHierarchy() {
        baseView.addSubview(numberLabel)
        baseView.addSubview(setupLabel)
        baseView.addSubview(punchLabel)
        addSubview(baseView)
    }
    
    // MARK: - SetupLayout
    private func setupLayout() {
        baseView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(165)
        }

        numberLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(baseView.safeAreaLayoutGuide).offset(8)
        }

        setupLabel.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        punchLabel.snp.makeConstraints { make in
            make.top.equalTo(setupLabel).inset(65)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
    }

    // MARK: - Setup Cell public method
    func setupCell(number: Int, setup: String, punch: String) {
        self.numberLabel.text = "# \(number + 1)"
        self.setupLabel.text = setup
        self.punchLabel.text = punch
    }
}
