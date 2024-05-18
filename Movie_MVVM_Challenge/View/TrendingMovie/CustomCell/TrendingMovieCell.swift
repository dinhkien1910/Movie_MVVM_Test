//
//  TrendingMovieCell.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import UIKit

class TrendingMovieCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var dateMovie: UILabel!
    @IBOutlet weak var scoreMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containView.round()
        containView.backgroundColor = .systemGray5
        containView.addBorder(color: .lightGray, width: 1)
        imgMovie.round(5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(with data: TrendingMovieCellVM) {
        nameMovie.text = data.name
        dateMovie.text = data.date
        scoreMovie.text = data.score
        if let poster = data.image {
            if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(poster)") {
                ImageLoader.shared.loadImage(from: imageUrl) { [weak self] result in
                    switch result {
                    case .success(let img):
                        DispatchQueue.main.async {
                            self?.imgMovie.image = img
                        }
                    case .failure(let err):
                        print(err)
                    }
                }
            }
        } else {
            imgMovie.image = UIImage(named: "placeholder")
        }
    }
}
