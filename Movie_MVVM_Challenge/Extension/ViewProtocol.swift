//
//  ViewProtocol.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import Foundation
import UIKit
protocol NibLoadable {
    static func getNibName() -> String
    static func getNib() -> UINib
}

extension NibLoadable where Self: UIView {
    static func getNibName() -> String {
        return String(describing: self)
    }

    static func getNib() -> UINib {
        let mainBundle = Bundle.main
        return UINib.init(nibName: self.getNibName(), bundle: mainBundle)
    }
}

extension NSObject {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
