//
//  NetworkServicesProtocol.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import Foundation
public protocol NetworkServicesProtocol: AnyObject {
    func request(info: RequestInfo, result: @escaping (Result<Data, NetworkServiceError>) -> Void)
}
