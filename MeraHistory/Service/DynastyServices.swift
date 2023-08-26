//
//  DynastyServices.swift
//  MeraHistory
//
//  Created by NhatMinh on 24/08/2023.
//

import Foundation
import Combine
import Alamofire
struct DynastyServices {
   
}


protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}


class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        
        // set up any other request parameters here
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    func requestAF<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, AFError> {
        
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
       
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]

        return AF.request(url,
                          method: .get,
                          headers: headers
                          )
        .validate()
        .publishDecodable(type: T.self)
        .value()
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
        
        
    }
}


protocol UserServiceProtocol {
    func getUsers() -> AnyPublisher<[User], AFError>
}

class UserService: UserServiceProtocol {
    let apiClient = URLSessionAPIClient<UserEndpoint>()
    
    
    func getUsers() -> AnyPublisher<[User], AFError> {
        return apiClient.requestAF(.getUsers)
    }
}
