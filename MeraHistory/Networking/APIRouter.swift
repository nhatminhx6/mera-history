//
//  APIRouter.swift
//  MeraHistory
//
//  Created by NhatMinh on 26/08/2023.
//

import Alamofire
import Foundation
enum APIRouter: URLRequestConvertible {
    case getUsers
    
    private var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getUsers:
            return "/users"
        }
    }
    private var parameters: Parameters? {
        switch self {
        case .getUsers:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
    
}


struct K {
    struct ProductionServer {
        static let baseURL = "https://64e86d0699cf45b15fdf8ae7.mockapi.io"
    }

}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
