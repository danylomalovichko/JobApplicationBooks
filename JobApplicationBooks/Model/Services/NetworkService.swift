//
//  NetworkService.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 07.07.2023.
//

import Alamofire
import Combine
import Foundation

@MainActor
protocol NetworkService {
    var lists: CurrentValueSubject<[List]?, Never> { get }
    func fetchLists()
}

class NetworkManager: NetworkService {
    let server = "https://api.nytimes.com"
    let apiKey = "uVMvU012jXVj8TI3COweMy5OpAfkzCnC"
    
    var lists: CurrentValueSubject<[List]?, Never> = .init([])
    
    func fetchLists() {
        AF.request("\(server)/svc/books/v3/lists/full-overview.json?api-key=\(apiKey)")
            .validate()
            .responseDecodable(of: ListResponseModel.self, decoder: JSONDecoder.snakeCaseDecoder) { response in
                switch response.result {
                case .success(let data):
                    self.lists.value = data.results.lists
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}
