//
//  TrendingMovieCellVM.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import Foundation

struct TrendingMovieCellVM {
    let id: Int
    let name: String
    let date: String
    let score: String
    let image: String?
    
    init(movie: Movie) {
        self.id = movie.id
        self.name = movie.name ?? movie.title ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        if movie.voteAverage == 10{
            self.score = String(format: "%.0f", movie.voteAverage) + "/10"
        } else {
            self.score = String(format: "%.1f", movie.voteAverage) + "/10"
        }
        self.image = movie.posterPath ?? ""
    }
}
