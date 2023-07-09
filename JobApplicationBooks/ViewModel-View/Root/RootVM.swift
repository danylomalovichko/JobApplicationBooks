//
//  RootVM.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 07.07.2023.
//

import Foundation

class RootVM: ObservableObject {
    let container: DependencyContainer
    
    init(_ container: DependencyContainer) {
        self.container = container
    }
}
