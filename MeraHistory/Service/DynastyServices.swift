//
//  DynastyServices.swift
//  MeraHistory
//
//  Created by NhatMinh on 24/08/2023.
//

import Foundation
import Combine
import Alamofire

protocol DynastyServiceProtocol {
    func getDynastyList() -> AnyPublisher<[DynastyModel], AFError>
}


class DynastyServices: DynastyServiceProtocol {
    let apiClient = URLSessionAPIClien()
    func getDynastyList() -> AnyPublisher<[DynastyModel], Alamofire.AFError> {
        return apiClient.request(router: APIRouter.getDynastyList)
    }
}

