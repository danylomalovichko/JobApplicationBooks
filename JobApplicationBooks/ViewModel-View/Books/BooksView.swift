//
//  BooksView.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 07.07.2023.
//

import SwiftUI
import WebKit

struct BooksView: View {
    @StateObject var vm: BooksVM
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(vm.list.books, id: \.self) { book in
                    VStack {
                        if let bookImageURL = URL(string: book.bookImage) {
                            AsyncImage(url: bookImageURL) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity, maxHeight: 400)
                                        .cornerRadius(10)
                                case .failure:
                                    Image(systemName: "xmark.circle")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity, maxHeight: 400)
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text(book.title)
                                .font(.headline)
                            Text(book.description)
                                .font(.subheadline)
                            Text("AuthorFormat \(book.author)")
                                .font(.subheadline)
                            Text("PublisherFormat \(book.publisher)")
                                .font(.subheadline)
                            Text("Rank \(book.rank)")
                                .font(.subheadline)
                            
                            NavigationLink(destination: {
                                BookStoresView(vm: .init(vm.container, stores: book.buyLinks))
                            }, label: {
                                Text("Links")
                                    .foregroundColor(.blue)
                            })
                            
                            Divider()
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
        }
        .navigationTitle("\(vm.list.listName)")
    }
}
