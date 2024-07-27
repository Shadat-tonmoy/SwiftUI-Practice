//
//  TestAlert.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 16/7/24.
//

import SwiftUI

struct TestAlert: View {
    
    @State var showAlert : Bool = false
    @State var showActionSheet : Bool = false
    @State var showContextMenu : Bool = false
    @State var textFieldText : String = ""
    
    var body: some View {
        
        VStack{
            Button(action: {
                showAlert.toggle()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
            Button(action: {
                showActionSheet.toggle()
            }, label: {
                Text("Show Action Sheet")
            })
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.purple)
                .frame(width: 275, height: 150)
                .overlay(content: {
                    VStack(alignment : .leading){
                        Text("Shadat Tonmoy")
                            .font(.largeTitle)
                        Label(
                            title: {
                                Text("Software Engineer II")
                                    .font(.headline)
                            },
                            icon: { /*@START_MENU_TOKEN@*/Image(systemName: "42.circle")/*@END_MENU_TOKEN@*/ }
                        )
                        
                        Label(
                            title: {
                                Text("Kinetik Health Care Inc")
                                    .font(.headline)
                            },
                            icon: { /*@START_MENU_TOKEN@*/Image(systemName: "42.circle")/*@END_MENU_TOKEN@*/ }
                        )
                    
                        
                        
                        
                    }
                    .foregroundStyle(.white)
                })
            .contextMenu(menuItems: {
                /*@START_MENU_TOKEN@*/Text("Menu Item 1")/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("Menu Item 2")/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("Menu Item 3")/*@END_MENU_TOKEN@*/
            })
            
            
        }
        .alert("Something Went Wrong! Please try again later", isPresented: $showAlert, actions: {
            HStack {
                Text("Cancel")
                Text("Okay")
                
            }
        })
        .confirmationDialog("Hello", isPresented: $showAlert, titleVisibility: .visible) {
            Button("Red", action: {
                
            })
            
            Button("Blue", action: {
                
            })
        }
        .confirmationDialog("Hello", isPresented: $showActionSheet, actions: {
            Button(action: {
                
            }, label: {
                Text("Blue")
                    .foregroundStyle(.blue)
                
            })
            
            
            Button(action: {
                
            }, label: {
                Text("Green")
                    .background()
                
            })
            
            Button(action: {
                
            }, label: {
                Text("Red")
                    .foregroundStyle(.red)
                
            })
            
            Button(action: {
                
            }, label: {
                Text("Purple")
                    .foregroundStyle(.purple)
                
            })
            
        }, message: {
            Text("Select a color")
            
        })
        
        Spacer()
            .frame(height: 20)
        
        TextField("Hey There", text: $textFieldText)
//            .textFieldStyle(.roundedBorder)
            
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    
            )
            .foregroundStyle(.white)
            .padding(.horizontal,30)
        
        
    }
}

#Preview {
    TestAlert()
}
