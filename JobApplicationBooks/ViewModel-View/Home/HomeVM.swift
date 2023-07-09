//
//  HomeVM.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 04.07.2023.
//

import Foundation

@MainActor
class HomeVM: BaseVM {
    @Published var lists: [List] = []

    override init(_ container: DependencyContainer) {
        super.init(container)
        
        container.lists.lists
            .compactMap { $0 }
            .assign(to: &$lists)
        
        updateLists()
    }
    
    func updateLists() {
        container.lists.update()
    }
}
