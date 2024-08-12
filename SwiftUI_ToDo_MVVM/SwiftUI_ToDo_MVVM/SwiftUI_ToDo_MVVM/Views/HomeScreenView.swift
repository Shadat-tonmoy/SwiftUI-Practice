//
//  HomeScreenView.swift
//  SwiftUI_ToDo_MVVM
//
//  Created by Shadat Mufakhkhar Tonmoy on 27/7/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    @EnvironmentObject var viewModel : TodoListViewModel
    
    
    var body: some View {
        ZStack {
            if viewModel.todoItems.isEmpty {
                EmptyListView()
            } else {
                ListView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeScreenView()
            .environmentObject(TodoListViewModel())
    }
    
}
