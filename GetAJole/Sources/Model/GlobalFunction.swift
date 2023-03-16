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

func createSimpleLabel(with text: String, size: CGFloat) -> UILabel {
    let label = UILabel()
    label.textColor = .black
    label.text = text
    label.font = UIFont(name: "Marker Felt Thin", size: size)
    label.numberOfLines = 0
    label.lineBreakStrategy = .pushOut
    
    return label
}

func createFavoriteLabel(with text: String, size: CGFloat) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = UIFont(name: "Noteworthy-Bold", size: size)
    label.textColor = .black
    
    return label
}

func createMainButton(cornerRadius: CGFloat) -> UIButton {
    let button = UIButton()
    button.layer.cornerRadius = cornerRadius
    button.clipsToBounds = true
    button.titleLabel?.font = UIFont(name: "Noteworthy-Bold", size: 15)
    
    return button
}

func createFavoritesTableView() -> UITableView {
    let tableView = UITableView(frame: .zero, style: .plain)
    tableView.backgroundColor = .systemGray6
    tableView.showsVerticalScrollIndicator = false
    tableView.register(FavoritesCell.self, forCellReuseIdentifier: "favoritesCell")
    tableView.separatorStyle = .none
    //    tableView.register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
    
    return tableView
}

func createBackView(cornerRadius: CGFloat) -> UIView {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = cornerRadius
    view.clipsToBounds = true
    view.layer.borderColor = UIColor.purple.cgColor
    view.layer.borderWidth = 4
    
    return view
}

func makeMoveUpWithFadeAnimation(rowHeight: CGFloat, duration: TimeInterval, delayFactor: TimeInterval) -> TableCellAnimation {
    return { cell, indexPath, _ in
        cell.transform = CGAffineTransform(translationX: 0, y: rowHeight * 1.4)
        cell.alpha = 0
        UIView.animate(
            withDuration: duration,
            delay: delayFactor * Double(indexPath.row),
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
            })
    }
}
