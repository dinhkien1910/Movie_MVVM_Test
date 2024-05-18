//
//  GetListActorAPI.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import Foundation
protocol GetListActorAPIProtocol {
    func getListActors(movieID: Int, result: @escaping (Result<[ActorModel], APIError>) -> Void)
}

final class GetListActorAPI: BaseAPIFetcher {
    override func apiURL(_ optionalPath: String?, _ page: Int?, _ querySearch: String?) -> URL {
        guard let url = URL(string:
        "https://api.themoviedb.org/3/movie/\(optionalPath ?? "")/credits\(ServerConstant.APIKey.key)") else {
            fatalError("Login URL failed")
    }
        return url
    }
}

extension GetListActorAPI: GetListActorAPIProtocol {
    func getListActors(movieID: Int, result: @escaping (Result<[ActorModel], APIError>) -> Void) {

        // Prepare login URL
        let listActorURL: URL = apiURL("\(movieID)", nil, nil)
        let requestInfo: RequestInfo = RequestInfo(urlInfo: listActorURL, httpMethod: .get, params: nil)

        networkServices.request(info: requestInfo) { [weak self] (responseResult) in
            guard let self = self else {
                result(.failure(.decodeDataFailed))
                return
            }
            switch responseResult {
            case .success(let data):
                do {
                    let responseEntity = try self.decodeData(data, type: ListActorModel.self)
                    result(.success(responseEntity.cast))
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
