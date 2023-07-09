//
//  BaseVM.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 07.07.2023.
//

import Combine

@MainActor
class BaseVM: ObservableObject {
    
    let container: DependencyContainer
    internal var bag = Set<AnyCancellable>()
    
    init(_ container: DependencyContainer) {
        self.container = container
    }
}
