//
//  SwiftUI_ToDo_MVVMApp.swift
//  SwiftUI_ToDo_MVVM
//
//  Created by Shadat Mufakhkhar Tonmoy on 25/7/24.
//

import SwiftUI

@main
struct SwiftUI_ToDo_MVVMApp: App {
    
    @StateObject var viewModel : TodoListViewModel = TodoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeScreenView()
            }
            .environmentObject(viewModel)
            
            
        }
    }
}
