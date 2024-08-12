//
//  AddNewToDoView.swift
//  SwiftUI_ToDo_MVVM
//
//  Created by Shadat Mufakhkhar Tonmoy on 25/7/24.
//

import SwiftUI

struct AddNewToDoView: View {
    
    @State var todoText : String = ""
    @State var showInvalidTextAlert : Bool = false
    
    @EnvironmentObject var viewModel : TodoListViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing : 20) {
            ZStack(alignment : .trailing) {
                TextField("Enter Todo Here", text: $todoText)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray.opacity(0.15))
                )
                
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.gray)
                    .imageScale(.large)
                    .padding(.trailing)
                    .onTapGesture {
                        todoText = ""
                    }
            }
            
            Button(action: {
                if isValidText() {
                    viewModel.addTodoItem(title: todoText)
                    dismiss()
                }
                
                
            }, label: {
                Text("Add Todo")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(maxWidth: 400)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill( isValidText() ? .purple : .gray)
                    
                    )
                    
            })
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Add an item")
        
    }
    
    private func isValidText() -> Bool {
        return todoText.count >= 3
    }
}

#Preview {
    AddNewToDoView()
}
