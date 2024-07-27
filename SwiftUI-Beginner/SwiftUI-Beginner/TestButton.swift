//
//  TestButton.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/7/24.
//

import SwiftUI

struct TestButton: View {
    
    @State var message = "No button was pressed"
    
    var body: some View {
        VStack(spacing : 30){
            
            Text(message)
            
            Button("Button 1", action: {
                message = "Button 1 was pressed!"
            })
            
            Button(action: {
                message = "Button 2 was pressed!"
                
            }, label: {
                Text("Button 2")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    
                    
            })
            
            Button(action: {
                message = "Cancel button was pressed!"
                
            }, label: {
                Text("Cancel")
                    .padding()
                    .padding(.horizontal,30)
                    .foregroundStyle(Color.gray)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 2)
                    )
            })
        }
    }
}

#Preview {
    TestButton()
}
