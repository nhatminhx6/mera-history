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




protocol UserServiceProtocol {
    func getUsers() -> AnyPublisher<[User], AFError>
}

class UserService: UserServiceProtocol {
    let apiClient = URLSessionAPIClien()
    
    func getUsers() -> AnyPublisher<[User], AFError> {
        return apiClient.request(router: APIRouter.getUsers)
    }
}
