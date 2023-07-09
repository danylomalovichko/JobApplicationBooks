//
//  HomeView.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 04.07.2023.
//

import SwiftUI
import Alamofire

struct HomeView: View {
    @StateObject var vm: HomeVM
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(vm.lists, id: \.listId) { list in
                        NavigationLink(destination: {
                            BooksView(vm: .init(vm.container, list: list))
                        }, label: {
                            Text(list.listName)
                                .foregroundColor(.black)
                        })
                        
                        Divider()
                    }
                   
                }
                .padding(.top, 15)
            }
        }
        .onAppear {
            vm.updateLists()
        }
    }
}
