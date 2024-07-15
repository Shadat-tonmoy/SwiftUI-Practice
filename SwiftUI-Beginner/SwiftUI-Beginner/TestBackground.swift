//
//  TestBackground.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 9/7/24.
//

import SwiftUI

struct TestBackground: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 100)
                .padding()
                .background(
                    Circle()
                        .fill(.blue)
                )
                .frame(width: 150, height: 150)
                .background(
                    Circle()
                        .fill(.green)
                )
            
            Circle()
                .fill(.red)
                .frame(width: 150,height: 150)
                .padding()
                .overlay(content: {
                    Text("1")
                        .foregroundStyle(Color(.white))
                        .font(.largeTitle)
                        .bold()
                })
            
            Rectangle()
                .frame(width: 150, height: 150)
                .overlay(alignment: .bottomTrailing,
                         content: {
                    Text("2")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.leading)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100,alignment: .topLeading)
                        .background(Rectangle()
                            .fill(.red))
                    
                        
                    
                })
                .overlay(alignment: .bottomTrailing,content: {
                    Text("1")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(.gray)
                    
                })
            
            Spacer()
                .frame(height: 50)
            
            Image(systemName: "cart.fill")
                .foregroundColor(.white)
                .font(.system(size: 50))
                .frame(width: 100, height: 100)
                .padding(5.0)
                .background(
                    RoundedRectangle(cornerRadius: 32)
                        .fill(LinearGradient(colors: [Color("GradientStart"),Color("GradientEnd")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                )
                .overlay(alignment: .topTrailing, content: {
                    Text("1")
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .fill(.red)
                        )
                })
            
            
        }
        
    }
}

#Preview {
    TestBackground()
}
