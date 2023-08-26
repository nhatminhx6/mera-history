//
//  UserViewModel.swift
//  MeraHistory
//
//  Created by NhatMinh on 25/08/2023.
//

import Foundation
import Combine
class UsersViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let userService: UserServiceProtocol
    @Published var users: [User] = []
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func fetchUsers() {
        userService.getUsers()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
            
        }, receiveValue: {[weak self] data in
            self?.users = data
        }).store(in: &cancellables)
    }
}
