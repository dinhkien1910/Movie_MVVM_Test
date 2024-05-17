//
//  BaseAPIFetcher.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import Foundation

public enum APIError: Error {
    case unknowError
    case serverError
    case encodeParamsFailed
    case decodeDataFailed
}


class BaseAPIFetcher {
    let networkServices: NetworkServicesProtocol

    init(networkServices: NetworkServicesProtocol = NetworkServices()) {
        self.networkServices = networkServices
    }

    func apiURL(_ optionalPath: String?, _ page: Int?, _ querySearch: String?) -> URL {
        fatalError("API URL must be override in child class")
    }

    func decodeData<T: Decodable>(_ data: Data, type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        do {
            let response: T = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch let error {
            print(error)
            throw APIError.decodeDataFailed
        }
    }
}
