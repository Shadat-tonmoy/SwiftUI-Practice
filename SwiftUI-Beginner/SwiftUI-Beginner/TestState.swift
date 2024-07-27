//
//  TestState.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/7/24.
//

import SwiftUI

struct TestState: View {
    
    @State var backgroundColor = Color.red
    
    let dummyColors = [Color.red,Color.green,Color.blue,Color.purple,Color.yellow,Color.orange]
    
    var body: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            
            VStack{
                Text("Hello World!")
                    .foregroundStyle(Color.white)
                
                Button(action: {
                    let randomColor = dummyColors.randomElement()
                    backgroundColor = randomColor ?? Color.red
                    
                }, label: {
                    Text("Change Color")
                        .padding()
                        .foregroundStyle(backgroundColor)
                        .background(
                            RoundedRectangle(cornerRadius:10)
                                .fill(Color.white)
                                
                        )
                    
                })
            }
        }
    }
}

#Preview {
    TestState()
}
