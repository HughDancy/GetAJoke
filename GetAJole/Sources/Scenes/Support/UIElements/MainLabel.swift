//
//  MainLabel.swift
//  GetAJole
//
//  Created by Борис Киселев on 06.09.2024.
//

import UIKit

final class MainLabel: UILabel {
    // MARK: - Init
    init(text: String, size: CGFloat) {
        super.init(frame: .zero)
        self.text = text
        self.font = UIFont(name: "Marker Felt Thin", size: size)
        self.textColor = .label
        self.numberOfLines = 0
        self.lineBreakStrategy = .pushOut
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
