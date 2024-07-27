//
//  TestConditional.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 12/7/24.
//

import SwiftUI

struct TestConditional: View {
    
    @State var showCircle = false
    
    var body: some View {
        VStack(spacing : 20){
            if showCircle {
                Circle()
                    .frame(width: 100, height: 100)
            }
            
            Button(action: {
                showCircle.toggle()
                
            }, label: {
                Text("Toggle Circle")
            })
        }
    }
}

#Preview {
    TestConditional()
}
