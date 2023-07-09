//
//  RootView.swift
//  JobApplicationBooks
//
//  Created by Danylo Malovichko on 07.07.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var vm = RootVM(DependencyContainer())
    
    var body: some View {
        HomeView(vm: .init(vm.container))
    }
}
