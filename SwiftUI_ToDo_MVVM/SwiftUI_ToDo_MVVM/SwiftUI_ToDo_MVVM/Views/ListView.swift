//
//  ListView.swift
//  SwiftUI_ToDo_MVVM
//
//  Created by Shadat Mufakhkhar Tonmoy on 25/7/24.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel : TodoListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.todoItems, id: \.id) { item in
                ListItemRowView(todoItem: item)
                    .onTapGesture {
                        viewModel.updateIsCompleted(todoItem: item)
                    }
                    
            }
            .onDelete(perform: viewModel.deleteItem)
            .onMove(perform: viewModel.moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("Todo List")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    AddNewToDoView()
                    
                } label: {
                    Text("Add")
                }

            }
            
        
        }
    }
    
    var list = List {
        
    }
}

#Preview {
    NavigationView {
        ListView(viewModel: TodoListViewModel())
            
    }
    
}
