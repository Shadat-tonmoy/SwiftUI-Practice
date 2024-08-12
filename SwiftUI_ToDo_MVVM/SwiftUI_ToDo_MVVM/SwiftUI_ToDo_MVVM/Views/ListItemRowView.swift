//
//  ListItemRowView.swift
//  SwiftUI_ToDo_MVVM
//
//  Created by Shadat Mufakhkhar Tonmoy on 25/7/24.
//

import SwiftUI

struct ListItemRowView: View {
    
    let todoItem : TodoItem
    
    var body: some View {
        HStack {
            Image(systemName: todoItem.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(todoItem.isCompleted ? .green : .red)
            
            Text(todoItem.title)
                .padding(.horizontal,5)
            Spacer()
        }
    }
}

#Preview {
    ListItemRowView(todoItem: TodoItem(title: "Test", isCompleted: true))
}
