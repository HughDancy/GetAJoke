//
//  ShadowView.swift
//  GetAJole
//
//  Created by Борис Киселев on 06.09.2024.
//

import UIKit

final class ShadowView: UIView {
    // MARK: - Init
    init(cornerRadius: CGFloat) {
        super.init(frame: .zero)
        self.backgroundColor = .lightGray
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
