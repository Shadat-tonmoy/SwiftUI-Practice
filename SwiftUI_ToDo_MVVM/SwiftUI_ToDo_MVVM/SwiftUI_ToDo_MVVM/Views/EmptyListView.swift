//
//  EmptyListView.swift
//  SwiftUI_ToDo_MVVM
//
//  Created by Shadat Mufakhkhar Tonmoy on 27/7/24.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack {
            Text("No Todo Item")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("There is no todo item found! Please add a new todo item. Tap the add button to add one!")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .font(.caption)
                .foregroundStyle(.gray)
            
            NavigationLink {
                AddNewToDoView()
            } label: {
                Text("Add New Item")
                    .padding()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.purple)
                    
                    )
                    .padding(.horizontal)
                    .padding(.top)
            }

            
            
            
        }
        .frame(maxWidth: 400)
    }
}

#Preview {
    NavigationView {
        EmptyListView()
    }
    
}
