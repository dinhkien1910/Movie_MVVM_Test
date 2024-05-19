//
//  ActorCell.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import UIKit

class ActorCell: UICollectionViewCell, NibLoadable {
    @IBOutlet weak var imgActor: UIImageView!
    @IBOutlet weak var nameActor: UILabel!
    @IBOutlet weak var containView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        imgActor.clipsToBounds = true
        imgActor.layer.cornerRadius = 6
        imgActor.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        containView.clipsToBounds = true
        containView.layer.cornerRadius = 6
        containView.backgroundColor = .nfGray
        nameActor.textColor = .nfWhite
    }
    
    func setupData(with data: ActorCellVM) {
        nameActor.text = data.name
        let placeHolder = UIImage(named: "person")
        if let poster = data.avatar {
            if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(poster)") {
                ImageLoader.shared.loadImage(from: imageUrl) { [weak self] result in
                    switch result {
                    case .success(let img):
                        DispatchQueue.main.async {
                            self?.imgActor.image = img
                        }
                    case .failure(let err):
                        print(err)
                    }
                }
            }
        } else {
            imgActor.image = UIImage(named: "person")
        }
    }

}
