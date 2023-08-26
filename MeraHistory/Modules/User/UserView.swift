//
//  UserView.swift
//  MeraHistory
//
//  Created by NhatMinh on 25/08/2023.
//

import Foundation
import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UsersViewModel(userService: UserService())
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}
