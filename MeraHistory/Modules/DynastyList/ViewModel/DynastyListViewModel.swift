//
//  DynastyListViewModel.swift
//  MeraHistory
//
//  Created by NhatMinh on 24/08/2023.
//

import Foundation
import Combine

class DynastyListViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let dynastyService: DynastyServiceProtocol
    @Published var dynastyList: [DynastyModel] = []
    
    init(dynastyService: DynastyServiceProtocol) {
        self.dynastyService = dynastyService
    }
    func getDynastyLis() {
        self.dynastyService.getDynastyList()
            .receive(on: RunLoop.main)
            .sink { data in
                
            } receiveValue: { data in
                self.dynastyList =  data
            }.store(in: &cancellables)

    }
}


