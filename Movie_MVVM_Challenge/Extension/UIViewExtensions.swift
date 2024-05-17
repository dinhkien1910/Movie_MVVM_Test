//
//  UIViewExtensions.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import UIKit
extension UIView {
    func round( _ radious: CGFloat = 10) {
        self.layer.cornerRadius = radious
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
