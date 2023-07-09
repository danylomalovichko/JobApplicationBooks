//
//  BookStoreLink.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 08.07.2023.
//

import Foundation
import RealmSwift

struct BookStoreLink: Codable, Hashable {
    let name: String
    let url: String
}

extension BookStoreLink {
    init(object: BookStoreLinkRLM) {
        name = object.name
        url = object.url
    }
}

class BookStoreLinkRLM: Object {
    @Persisted var name: String
    @Persisted var url: String
}

extension BookStoreLinkRLM {
    convenience init(link: BookStoreLink) {
        self.init()
        name = link.name
        url = link.url
    }
}
