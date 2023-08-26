//
//  DynastyListView.swift
//  MeraHistory
//
//  Created by NhatMinh on 24/08/2023.
//

import Foundation
import SwiftUI

struct DynastyList: View {
    @StateObject var viewModel = DynastyListViewModel(dynastyService: DynastyServices())
    
    var body: some View {
        List(viewModel.dynastyList) { dynasty in
            Text(dynasty.name)
        }
        .onAppear {
            viewModel.getDynastyLis()
        }
    }
}
