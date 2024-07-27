//
//  TestTextField.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 16/7/24.
//

import SwiftUI

struct TestTextField: View {
    
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var showSheet : Bool = false
    
    var body: some View {
        NavigationView(content: {
            VStack(spacing : 20){
                
               InputField(value: $firstName,
                          hintText: "First Name")
                
                InputField(value: $lastName,
                          hintText: "Last Name")
                
                Button(action: {
                    print("\(firstName)-> \(lastName)")
                    showSheet.toggle()
                    
                }, label: {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                        )
                        
                        
                })
                
                
                Spacer()
                
                
            }
            .padding()
            .navigationTitle("Text Input Field")
            .sheet(isPresented: $showSheet, content: {
                TextInputInfoViewSheet(firstName: $firstName, lastName: $lastName)
                    .presentationDetents([.fraction(0.25)])
            })
           
        })
        
    }
}

#Preview {
    TestTextField()
}

struct TextInputInfoViewSheet : View {
    @Binding var firstName : String
    @Binding var lastName : String
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
            VStack{
                Text("Hello \(firstName) \(lastName)")
                    .foregroundStyle(.white)
            }
        }
        .onAppear{
            print("FromSheet firt Name : \(firstName), lastName : \(lastName)")
        }
        
    }
}

struct InputField: View {
    
    @Binding var value : String
    var hintText : String
    
    var body: some View {
        TextField(hintText, text: $value)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2))
            )
    }
}
