//
//  BookStoresView.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 08.07.2023.
//

import Foundation
import SwiftUI

struct BookStoresView: View {
    @StateObject var vm: BookStoreVM
    
    var body: some View {
        ForEach(vm.stores, id: \.self) { bookStore in
            if let url = URL(string: bookStore.url) {
                
                NavigationLink(destination: {
                    StoreView(vm: .init(vm.container, url: url))
                }, label: {
                    Text(bookStore.name)
                        .foregroundColor(.blue)
                })
                
                Divider()
            }
        }
    }
    
}
