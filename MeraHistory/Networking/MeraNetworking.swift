//
//  MeraNetworking.swift
//  MeraHistory
//
//  Created by NhatMinh on 26/08/2023.
//

import Foundation
import Combine
import Alamofire

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

//enum HTTPMethod: String {
//    case get = "GET"
//    case post = "POST"
//    case put = "PUT"
//    case patch = "PATCH"
//    case delete = "DELETE"
//}

enum APIError: Error {
    case invalidResponse
    case invalidData
}

enum UserEndpoint: APIEndpoint {

    case getUsers
    var baseURL: URL {
        return URL(string: "https://64e86d0699cf45b15fdf8ae7.mockapi.io")!
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getUsers:
            return ["Authorization": "Bearer TOKEN"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getUsers:
            return ["page": 1, "limit": 10]
        }
    }
    
 
}
