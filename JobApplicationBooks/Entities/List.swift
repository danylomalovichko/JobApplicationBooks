//
//  Lists.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 07.07.2023.
//

import RealmSwift

struct List: Codable {
    let listId: Int
    let listName: String
    let books: [Book]
}

extension List {
    init(object: ListRLM) {
        listId = object.listId
        listName = object.listName
        books = object.books.map {
            Book(object: $0)
        }
    }
}

class ListRLM: Object {
    @Persisted(primaryKey: true) var listId: Int
    @Persisted var listName: String
    @Persisted var books: RealmSwift.List<BookRLM>
}

extension ListRLM {
    convenience init(_ model: List) {
        self.init()
        listId = model.listId
        listName = model.listName
        let booksRLM = model.books.map {
            BookRLM(book: $0)
        }
        books.append(objectsIn: booksRLM)
    }
}
