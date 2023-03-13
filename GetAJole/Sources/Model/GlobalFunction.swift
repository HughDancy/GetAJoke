//
//  GlobalFunction.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit

func createMainImageView(with imageName: String) -> UIImageView {
    let imageView = UIImageView()
    imageView.image = UIImage(named: imageName)
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    return imageView
}

func createShadowView(cornerRadius: CGFloat) -> UIView {
    let view = UIView()
    view.backgroundColor = .lightGray
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 4, height: 4)
    view.layer.shadowOpacity = 0.7
    view.layer.shadowRadius = 4
    view.layer.cornerRadius = cornerRadius
    
    return view
}

func createMainLabel(with text: String) -> UILabel {
    let label = UILabel()
    label.textColor = .black
    label.text = text
    label.font = UIFont(name: "MarkerFelt", size: 20)
    label.numberOfLines = 0
    label.lineBreakStrategy = .pushOut
    
    return label
}

func createMainButton(cornerRadius: CGFloat) -> UIButton {
    let button = UIButton()
    button.layer.cornerRadius = cornerRadius
    button.clipsToBounds = true
    
    return button
}
