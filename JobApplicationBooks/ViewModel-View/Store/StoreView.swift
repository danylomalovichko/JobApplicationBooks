//
//  StoreView.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 09.07.2023.
//

import SwiftUI

struct StoreView: View {
    @StateObject var vm: StoreVM
    
    var body: some View {
        ScrollView {
            WebView(url: vm.url)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }
    }
}
