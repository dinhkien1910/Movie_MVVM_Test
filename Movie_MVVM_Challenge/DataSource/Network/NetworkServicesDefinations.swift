//
//  NetworkServicesDefinations.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import Foundation

public enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case patch  = "PATCH"
    case delete = "DELETE"
}

public enum NetworkServiceError: Error {
    case serverError
    case authenError
    case noData
    case encodeFailed
}

public typealias HTTPHeaders        = [String: Any]
public typealias RequestParameters  = [String: Any]

public struct RequestInfo {
    var urlInfo: URL
    var httpMethod: HTTPMethod
    var header: HTTPHeaders?
    var params: RequestParameters?

    init(urlInfo: URL, httpMethod: HTTPMethod, header: HTTPHeaders? = nil, params: RequestParameters? = nil) {
        self.urlInfo = urlInfo
        self.httpMethod = httpMethod
        self.header = header
        self.params = params
    }
}

