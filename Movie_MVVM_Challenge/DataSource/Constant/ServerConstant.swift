//
//  ServerConstant.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import Foundation
struct ServerConstant {
    struct URLBase {
        static var baseURL = "https://api.themoviedb.org/3/"
    }
    struct APIKey {
        static let key = "?api_key=d5b97a6fad46348136d87b78895a0c06"
    }
    struct URLPath {
        static var listActor = "https://api.themoviedb.org/3/movie/"
    }
}
