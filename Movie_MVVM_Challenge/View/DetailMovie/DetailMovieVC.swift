//
//  DetailMovieVC.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import UIKit

class DetailMovieVC: UIViewController {

    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var imgBackDrop: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var genresMovie: UILabel!
    @IBOutlet weak var languegeMovie: UILabel!
    @IBOutlet weak var subInfoMovie: UILabel!
    @IBOutlet weak var imgStar1: UIImageView!
    @IBOutlet weak var imgStar2: UIImageView!
    @IBOutlet weak var imgStar3: UIImageView!
    @IBOutlet weak var imgStar4: UIImageView!
    @IBOutlet weak var imgStar5: UIImageView!
    @IBOutlet weak var averageVoteMovie: UILabel!
    @IBOutlet weak var overViewMovie: UILabel!
    var movieID: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
