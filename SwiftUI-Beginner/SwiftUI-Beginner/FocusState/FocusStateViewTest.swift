//
//  FocusStateViewTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 31/7/24.
//

import SwiftUI

struct FocusStateViewTest: View {

    
    @StateObject var viewModel : FocusStateViewModel = FocusStateViewModel()
    
    @FocusState var userNameInFocus : Bool
    @FocusState var passwordInFocus : Bool

    
    
    var body: some View {
        VStack {
            
            VStack {
                TextField("User Name", text: $viewModel.userName)
                    .focused($userNameInFocus)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.25))
                            .stroke(.red, lineWidth: viewModel.invalidUserName ? 3 : 0)
                    )
                    .onSubmit {
                        print("User name submitted")
                        passwordInFocus = true
                        
                    }
                    .onReceive(viewModel.$invalidUserName, perform: { value in
                        userNameInFocus = value
                    })
                
                
                if viewModel.invalidUserName {
                    Text("Invalid user name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.callout)
                        .foregroundStyle(.red)
                        .padding(.leading,5)
                }
                
                
                
            }
            .padding()
            
            VStack {
                SecureField("Password", text: $viewModel.password)
                    .focused($passwordInFocus)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.25))
                            .stroke(.red, lineWidth: viewModel.invalidPassword ? 3 : 0)
                    )
                    .onReceive(viewModel.$invalidPassword, perform: { value in
                        passwordInFocus = value
                    })
                
                if viewModel.invalidPassword {
                    Text("Invalid password")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.callout)
                        .foregroundStyle(.red)
                        .padding(.leading,5)
                    
                }
                
            }
            .padding()
            
            Text("Submit")
                .padding()
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.purple)
                )
                .padding(.horizontal)
                .onTapGesture {
                    viewModel.validateField()
                }
        }
    }
}

#Preview {
    FocusStateViewTest()
}
