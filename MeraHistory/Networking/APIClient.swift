//
//  APIClient.swift
//  MeraHistory
//
//  Created by NhatMinh on 26/08/2023.
//

import Foundation
import Alamofire
import Combine


protocol APIClient {
    func request<T: Decodable>(router: URLRequestConvertible) -> AnyPublisher<T, AFError>
}

class URLSessionAPIClien: APIClient {
    func request<T: Decodable>(router: URLRequestConvertible) -> AnyPublisher<T, AFError> {
        return AF.request(router)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}
