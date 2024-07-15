//
//  TestStack.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 9/7/24.
//

import SwiftUI

struct TestStack: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 25, content: {
            
            HStack{
                Rectangle()
                    .frame(width: 50,height: 50)
                    .foregroundColor(.red)
                
                Rectangle()
                    .frame(width: 50,height: 50)
                    .foregroundColor(.gray)
                
                Rectangle()
                    .frame(width: 50,height: 50)
                    .foregroundColor(.orange)
                
                Rectangle()
                    .frame(width: 50,height: 50)
                    .foregroundColor(.purple)
                
                Rectangle()
                    .frame(width: 50,height: 50)
                    .foregroundColor(.teal)
                
                
                Rectangle()
                    .frame(width: 50,height: 50)
                    .foregroundColor(.cyan)
            }
            
            ZStack(alignment : .topLeading, content: {
                Rectangle()
                    .frame(width: 300, height: 200)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                Rectangle()
                    .frame(width: 250, height: 150)
                    .foregroundColor(.red)
                
                Rectangle()
                    .frame(width: 150, height: 75)
                    .foregroundColor(.green)
                
            })
            
            Rectangle()
                .frame(width: 100, height: 200)
                .foregroundColor(.gray)
            
            Rectangle()
                .frame(width: 200, height: 100)
                .foregroundColor(.green)
            
            Rectangle()
                .frame(width: 300, height: 100)
                .foregroundColor(.blue)
        })
    }
}

#Preview {
    TestStack()
}
