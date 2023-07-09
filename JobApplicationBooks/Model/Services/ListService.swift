//
//  ListService.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 08.07.2023.
//

import Combine
import RealmSwift

@MainActor
protocol ListService {
    
    var lists: CurrentValueSubject<[List]?, Never> { get }
    func update()
}

class ListManager: ListService {
    
    private var bag = Set<AnyCancellable>()
    private let storage: StorageService
    private let network: NetworkService

    var lists: CurrentValueSubject<[List]?, Never> = .init([])

    init(storage: StorageService, network: NetworkService) {
        self.storage = storage
        self.network = network
        
        network.lists
            .compactMap { $0 }
            .sink { [weak self] data in
                guard let self else {
                    return
                }
                Task {
                    await self.save(data)
                    await self.getList()
                }
            }
            .store(in: &bag)
    }
    
    private func getList() async {
        let data = storage.fetch(by: ListRLM.self)
        lists.value = data.map {
            List(object: $0)
        }
    }
    
    private func save(_ data: [List]) async {
        let listsRLM = data
            .map { ListRLM($0) }
        
        do {
            try await self.storage.saveOrUpdate(objects: listsRLM)
        } catch {
            print("Error saving to database")
        }
    }
    
    func update() {
        network.fetchLists()
    }
    
}
