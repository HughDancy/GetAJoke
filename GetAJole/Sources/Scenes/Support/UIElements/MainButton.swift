//
//  MainButton.swift
//  GetAJole
//
//  Created by Борис Киселев on 06.09.2024.
//

import UIKit

final class MainButton: UIButton {
    // MARK: - Properties
    var text: String?

    // MARK: - Init
    init(radius: CGFloat, text: String?, color: UIColor?) {
        super.init(frame: .zero)
        self.layer.cornerRadius = radius
        self.backgroundColor = color
        self.text = text
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Common Init
    private func commonInit() {
        self.setTitle(text, for: .normal)
    }
}
