//
//  TrendingMovieVM.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import Foundation
class TrendingMovieVM {
    var isLoadingData: Observable<Bool> = Observable(false)
    var listMovie: TrendingMovieModel?
    var movies: Observable<[TrendingMovieCellVM]> = Observable(nil)
    private let listMovieAPI: GetListMovieAPIProtocol = GetListMovieAPI()
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return listMovie?.results.count ?? 0
    }
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        listMovieAPI.getListMovies { [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let trendingMovieData):
                self?.listMovie = trendingMovieData
                self?.mapMovieData()
            case .failure(let err):
                print(err)
            }
        }
    }

    private func mapMovieData() {
        movies.value = self.listMovie?.results.compactMap({TrendingMovieCellVM(movie: $0)})
    }

    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
    func retriveMovie(withId id: Int) -> Movie? {
        guard let movie = listMovie?.results.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
}
