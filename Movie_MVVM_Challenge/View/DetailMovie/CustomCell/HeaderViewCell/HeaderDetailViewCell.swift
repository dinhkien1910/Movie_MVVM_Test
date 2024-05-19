//
//  HeaderDetailViewCell.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 19/05/2024.
//

import UIKit

class HeaderDetailViewCell: UITableViewHeaderFooterView, NibLoadable {
    @IBOutlet weak var nameSection: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupTitle(with title: String) {
        nameSection.text = title
    }
}
