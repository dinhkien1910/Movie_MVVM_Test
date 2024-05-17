//
//  GetListMovieAPI.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import Foundation

protocol GetListMovieAPIProtocol {
    func getListMovies(result: @escaping (Result<TrendingMovieModel, APIError>) -> Void)
}

final class GetListMovieAPI: BaseAPIFetcher {
    override func apiURL(_ optionalPath: String?, _ page: Int?, _ querySearch: String?) -> URL {
        guard let url = URL(string:
        "https://api.themoviedb.org/3/trending/all/day?api_key=d5b97a6fad46348136d87b78895a0c06") else {
            fatalError("Login URL failed")
        }
        return url
    }
}

extension GetListMovieAPI: GetListMovieAPIProtocol {
    func getListMovies(result: @escaping (Result<TrendingMovieModel, APIError>) -> Void) {
        let listMovieURL: URL = apiURL("", nil, "")
        let requestInfo: RequestInfo = RequestInfo(urlInfo: listMovieURL, httpMethod: .get, params: nil)
        networkServices.request(info: requestInfo) { [weak self] (responseResult) in
            guard let self = self else {
                print("GetListTrendingAPI nil before complete callback")
                result(.failure(.decodeDataFailed))
                return
            }
            switch responseResult {
            case .success(let data):
                do {
                    let responseEntity = try self.decodeData(data, type: TrendingMovieModel.self)
                    result(.success(responseEntity))
                } catch let error {
                    print(error)
                    result(.failure(.decodeDataFailed))
                }
            case .failure(let error):
                print(error)
                result(.failure(.decodeDataFailed))
            }
        }
    }
}
