//
//  GetImageAPI.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import Foundation
import UIKit
class ImageLoader: BaseAPIFetcher {
    static let shared = ImageLoader()
    
    func loadImage(from url: URL, completion: @escaping (Result<UIImage?, APIError>) -> Void) {
        let requestInfo: RequestInfo = RequestInfo(urlInfo: url, httpMethod: .get, params: nil)
        networkServices.request(info: requestInfo) { [weak self] (responseResult) in
            guard let self = self else {
                completion(.failure(.decodeDataFailed))
                return
            }
            switch responseResult {
            case .success(let data):
                let image = UIImage(data: data)
                completion(.success(image))
            case .failure(let error):
                print(error)
                completion(.failure(.decodeDataFailed))
            }
        }
    }
}
