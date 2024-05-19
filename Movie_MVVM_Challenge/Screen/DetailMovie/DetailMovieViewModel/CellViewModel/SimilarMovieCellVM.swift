//
//  SimilarMovieCellVM.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import Foundation
struct SimilarMovieCellVM {
    let id: Int
    let poster: String?
    let title: String?
    let overview: String?
    let voteAverage: Double?

    init(similarMovie: SimilarMovieModel) {
        self.id = similarMovie.id ?? 0
        self.poster = similarMovie.backdropPath ?? similarMovie.posterPath
        self.title = similarMovie.title ?? similarMovie.originalTitle
        self.overview = similarMovie.overview ?? ""
        self.voteAverage = similarMovie.voteAverage ?? 0
    }
}
