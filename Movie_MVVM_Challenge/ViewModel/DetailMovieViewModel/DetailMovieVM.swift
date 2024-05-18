//
//  DetailMovieVM.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import Foundation
import Foundation
class DetailMovieVM {
    var isLoadingData: Observable<Bool> = Observable(false)
    var detailMovies: Observable<DetailMovieViewEntity> = Observable(nil)
    var similarMovies: Observable<[SimilarMovieCellVM]> = Observable(nil)
    var actors: Observable<[ActorCellVM]> = Observable(nil)

    private let listDetailMovieAPI: GetListDetailMovieAPIProtocol = GetListDetailMovieAPI()
    private let listSimilarMovieAPI: GetListSimilarMovieAPIProtocol = GetListSimilarMovieAPI()
    private let listActorAPI: GetListActorAPIProtocol = GetListActorAPI()

    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
    func getDetailMovieData(movieID: Int) {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        listDetailMovieAPI.getListDetailMovies(movieID: movieID){ [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let detailMovieData):
                self?.detailMovies.value = DetailMovieViewEntity(response: detailMovieData)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getSimilarMovieData(movieID: Int) {

        
        listSimilarMovieAPI.getListSimilarMovies(movieID: movieID){ [weak self] result in
            
            switch result {
            case .success(let similarMovieData):
                self?.similarMovies.value = similarMovieData.compactMap({SimilarMovieCellVM(similarMovie: $0)})
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getActorData(movieID: Int) {
        
        listActorAPI.getListActors(movieID: movieID){ [weak self] result in
            
            switch result {
            case .success(let actorData):
                self?.actors.value = actorData.compactMap({ActorCellVM(actor: $0)})
            case .failure(let err):
                print(err)
            }
        }
    }
    
}

struct DetailMovieViewEntity {
    let id: Int
    let name: String
    let poster: String
    let backdrop: String
    let genres: [Genre]?
    let title: String?
    let language: String
    let releaseDate: String
    let runtime: Int
    let country: String?
    let overview: String
    let averageVote: Double

    init(response: DetailMovieModel) {
        self.id = response.id ?? 0
        self.name = response.title ?? ""
        self.poster = response.posterPath ?? ""
        self.backdrop = response.backdropPath ?? ""
        self.genres = response.genres ?? []
        self.title = response.title ?? response.originalTitle
        self.language = response.spokenLanguages?.first?.name ?? ""
        self.releaseDate = response.releaseDate ?? ""
        self.runtime = response.runtime ?? 0
        if let firstCountry = response.productionCountries?.first {
               self.country = firstCountry.iso31661
           } else if let firstCompany = response.productionCompanies?.first {
               self.country = firstCompany.originCountry
           } else {
               self.country = nil
           }
        self.overview = response.overview ?? ""
        self.averageVote = response.voteAverage ?? 0
    }
}
