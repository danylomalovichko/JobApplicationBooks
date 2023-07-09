//
//  DependencyContainer.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 07.07.2023.
//

import Foundation

@MainActor
class DependencyContainer {
    let network: NetworkService
    let storage: StorageService
    let lists: ListService
    
    init() {
        storage = StorageService()
        network = NetworkManager()
        lists = ListManager(storage: storage, network: network)
    }
}
