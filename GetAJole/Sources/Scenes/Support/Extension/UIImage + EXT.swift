//
//  UIImage + EXT.swift
//  GetAJole
//
//  Created by Борис Киселев on 05.09.2024.
//

import UIKit.UIImage

extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
