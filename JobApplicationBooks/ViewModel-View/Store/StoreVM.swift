//
//  StoreVM.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 09.07.2023.
//

import SwiftUI

class StoreVM: BaseVM {
    
    @Published var url: URL
    
    init(_ container: DependencyContainer, url: URL) {
        self.url = url
        super.init(container)
    }
}
