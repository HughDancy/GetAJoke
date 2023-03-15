//
//  FavoritesCell.swift
//  GetAJole
//
//  Created by Борис Киселев on 14.03.2023.
//

import UIKit
import SnapKit

class FavoritesCell: UITableViewCell {
    
    //MARK: - Subview's
    
    let baseView = createBackView(cornerRadius: 20)
    let setupLabel = createSimpleLabel(with: "Test", size: 20)
    let punchLabel = createSimpleLabel(with: "Simple", size: 20)
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "favoritesCell")
        self.backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Hierarchy
    
    private func setupHierarchy() {
        
        baseView.addSubview(setupLabel)
        baseView.addSubview(punchLabel)
        addSubview(baseView)
    }
    
    
    //MARK: - SetupLayout
    
    private func setupLayout() {
        
        baseView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(165)
        }
        
        setupLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        punchLabel.snp.makeConstraints { make in
            make.top.equalTo(setupLabel).inset(65)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    //
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
}
