//
//  BookStoreVM.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 08.07.2023.
//

import SwiftUI

class BookStoreVM: BaseVM {
    @Published var stores: [BookStoreLink]
    
    init(_ container: DependencyContainer, stores: [BookStoreLink]) {
        self.stores = stores
        super.init(container)
    }
}

