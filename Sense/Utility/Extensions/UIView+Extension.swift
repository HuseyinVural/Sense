//
//  UIView+Extension.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import UIKit


extension UIView {
    func setGradientBackground() {
        layer.sublayers?.forEach({ (layer) in
            if ((layer as? CAGradientLayer) != nil) {
                layer.removeFromSuperlayer()
            }
        })
        
        let colorTop =  UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        let colorBottom = UIColor(red: 0.2353, green: 0.302, blue: 0.5294, alpha: 1.0)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableView {
}


