//
//  BooksVM.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 07.07.2023.
//

import Foundation
import Alamofire

class BooksVM: BaseVM {
    @Published var list: List
    
    init(_ container: DependencyContainer, list: List) {
        self.list = list
        super.init(container)
    }
}
