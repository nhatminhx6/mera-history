//
//  DynastyListView.swift
//  MeraHistory
//
//  Created by NhatMinh on 24/08/2023.
//

import Foundation
import SwiftUI

struct DynastyList: View {
    @ObservedObject var viewModel: DynastyListViewModel
    
    init(viewModel: DynastyListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("DynastyList")     // 1
            .font(.system(size: 40, weight: .bold, design: .default))
    }
}
