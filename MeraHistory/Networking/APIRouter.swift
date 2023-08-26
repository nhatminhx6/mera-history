//
//  APIRouter.swift
//  MeraHistory
//
//  Created by NhatMinh on 26/08/2023.
//

import Alamofire
import Foundation
enum APIRouter: URLRequestConvertible {
    case getDynastyList
    
    private var method: HTTPMethod {
        switch self {
        case .getDynastyList:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getDynastyList:
            return "/vndynasty"
        }
    }
    private var parameters: Parameters? {
        switch self {
        case .getDynastyList:
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
        urlRequest.setValue(ContentType.xApikey.rawValue, forHTTPHeaderField: HTTPHeaderField.xApikey.rawValue)
        
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
        static let baseURL = "https://merahistory-fd21.restdb.io/rest"
    }

}
//https://merahistory-fd21.restdb.io/rest/vndynasty

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case xApikey = "x-apikey"
}

enum ContentType: String {
    case json = "application/json"
    case xApikey = "c1de81530b95424e167df4bccb7f729096bb9"
}
