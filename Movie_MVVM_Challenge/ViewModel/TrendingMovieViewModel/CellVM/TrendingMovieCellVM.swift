//
//  TrendingMovieCellVM.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import Foundation

class TrendingMovieCellVM {
    var id: Int
    var name: String
    var date: String
    var score: String
    var image: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.name = movie.name ?? movie.title ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        if movie.voteAverage == 10{
            self.score = String(format: "%.0f", movie.voteAverage) + "/10"
        } else {
            self.score = String(format: "%.1f", movie.voteAverage) + "/10"
        }
        self.image = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "https://image.tmdb.org/t/p/w500/\(imageCode)")
    }
}
