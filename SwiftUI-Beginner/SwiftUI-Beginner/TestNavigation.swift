//
//  TestNavigation.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 15/7/24.
//

import SwiftUI

struct TestNavigation: View {
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView {
                    VStack{
                        NavigationLink(destination: {
                            SecondScreen()
                            
                        }, label: {
                            Text("Screen 1")
                        })
                        
                        NavigationLink(destination: {
                            SecondScreen()
                        }, label: {
                            Text("Screen 2")
                            
                        })
                        
                        NavigationLink(destination: {
                            SecondScreen()
                        }, label: {
                            Text("Screen 3")
                            
                        })
                        
                    }
                }
                
                
            }
            .navigationTitle(
                Text("Application Name")
            )
            
            
            
        }
        
        
    }
}

struct SecondScreen : View {
    var body: some View {
        @Environment(\.presentationMode) var presentationMode
        
        
        NavigationView {
            ZStack{
                Color.cyan.ignoresSafeArea()
                
                VStack{
                    Text("Hello World")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack{
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.white)
                                .font(.headline)
                            Text("Back")
                                .foregroundStyle(.white)
                                .font(.title3)
                        }
                        
                    })
                }
            }
            
            
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    TestNavigation()
}
