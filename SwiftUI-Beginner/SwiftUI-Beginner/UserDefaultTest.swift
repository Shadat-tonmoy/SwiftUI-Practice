//
//  UserDefaultTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 30/7/24.
//

import SwiftUI

struct UserDefaultTest: View {
    
    @StateObject var viewModel : UserDefaultTestViewModel = UserDefaultTestViewModel()
    
//    @State var userName : String = ""
    
    var body: some View {
        VStack {
            Text("Enter name and tap save button")
            
            TextField("Enter name here", text: $viewModel.userName)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.25))
                )
                .padding()
            
            Button(action: {
                viewModel.saveUserNameToCache()
            }, label: {
                Text("Save")
                    .padding()
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                    )
                    .padding(.horizontal)
            })
            
            Spacer()
        }
        .onAppear {
            viewModel.getUserNameFromCache()
//            userName =  viewModel.getUserNameFromCache()
        }
    }
}

#Preview {
    UserDefaultTest()
}
