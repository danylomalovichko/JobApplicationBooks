//
//  StorageService.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 08.07.2023.
//

import RealmSwift

@MainActor
class StorageService {
    private let storage: Realm?
    
    init() {
        self.storage = try? Realm()
    }
    
    func saveOrUpdate(object: Object) throws {
        guard let storage else {
            return
        }
        storage.writeAsync {
            storage.add(object, update: .all)
        }
    }
    
    func saveOrUpdate(objects: [Object]) async throws {
        try objects.forEach {
            try saveOrUpdate(object: $0)
        }
    }

    func delete(object: Object) throws {
        guard let storage else {
            return
        }
        try storage.write {
            storage.delete(object)
        }
    }
    
    func deleteAll() throws {
        guard let storage else {
            return
        }
        try storage.write {
            storage.deleteAll()
        }
    }
    
    func fetch<T: Object>(by type: T.Type) -> [T] {
        guard let storage else {
            return []
        }
        return storage.objects(T.self).toArray()
    }
}
