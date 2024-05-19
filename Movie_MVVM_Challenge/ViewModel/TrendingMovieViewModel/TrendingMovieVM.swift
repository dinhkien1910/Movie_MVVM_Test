//
//  TrendingMovieVM.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import Foundation
class TrendingMovieVM {
    var isLoadingData: Observable<Bool> = Observable(false)
    var movies: Observable<[TrendingMovieCellVM]> = Observable(nil)
    private let listMovieAPI: GetListMovieAPIProtocol = GetListMovieAPI()
    
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        listMovieAPI.getListMovies { [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let trendingMovieData):
                self?.movies.value = trendingMovieData.results.compactMap({TrendingMovieCellVM(movie: $0)})
            case .failure(let err):
                print(err)
            }
        }
    }
}
