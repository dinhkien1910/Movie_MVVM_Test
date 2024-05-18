//
//  TrendingMovieCell.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import UIKit

class TrendingMovieCell: UITableViewCell {
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
        loadImage(imgURL: data.image)
    }
    
    func loadImage(imgURL: URL?) {
            guard let url = imgURL else { return }
            
            // Show the activity indicator
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let self = self else { return }
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    // Display the loaded image
                    DispatchQueue.main.async {
                        self.imgMovie.image = image
                    }
                }
            }.resume()
        }
    
    
}
