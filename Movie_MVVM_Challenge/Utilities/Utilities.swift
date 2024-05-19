//
//  Utilities.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import Foundation
import UIKit
class Utilities {
    static let instance = Utilities()

    private init() { }

    func drawStar(scoreAverage: Double, stars: [UIImageView]) {
           for image in stars {
               image.tintColor = .white
               image.image = UIImage(named: "star.fill")
           }
           let numberStar: Int = Int(scoreAverage/2)
           if numberStar == 0 {
               return
           }
           for index in 0..<numberStar {
               stars[index].tintColor = UIColor(red: 255/255, green: 190/255, blue: 0/255, alpha: 1)
               stars[index].image = UIImage(named: "star.fill")
           }
       }

       func formatRuntime(runtime: Int) -> String {
           let hours = runtime / 60
           let minutes = runtime % 60
           return "\(hours)h\(minutes)mins"
       }
}
