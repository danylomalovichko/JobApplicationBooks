//
//  Book.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 04.07.2023.
//

import Foundation
import RealmSwift

struct Book: Codable, Hashable {
    let title: String
    let author: String
    let bookImage: String
    let description: String
    let publisher: String
    let rank: Int
    let buyLinks: [BookStoreLink]
}

extension Book {
    init(object: BookRLM) {
        title = object.title
        author = object.author
        bookImage = object.bookImage
        description = object.descriptionText
        publisher = object.publisher
        rank = object.rank
        buyLinks = object.buyLinks.map {
            BookStoreLink(object: $0)
        }
    }
}

class BookRLM: Object {
    @Persisted var title: String
    @Persisted var author: String
    @Persisted var bookImage: String
    @Persisted var descriptionText: String
    @Persisted var publisher: String
    @Persisted var rank: Int
    @Persisted var buyLinks: RealmSwift.List<BookStoreLinkRLM>
}

extension BookRLM {
    convenience init(book: Book) {
        self.init()
        title = book.title
        author = book.author
        bookImage = book.bookImage
        descriptionText = book.description
        publisher = book.publisher
        rank = book.rank
        let linksRLM = book.buyLinks
            .map {
                BookStoreLinkRLM(link: $0)
            }
        buyLinks.append(objectsIn: linksRLM)
    }
}
