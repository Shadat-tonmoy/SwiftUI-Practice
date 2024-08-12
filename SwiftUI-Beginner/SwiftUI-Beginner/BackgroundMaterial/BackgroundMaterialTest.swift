//
//  BackgroundMaterialTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 30/7/24.
//

import SwiftUI

struct BackgroundMaterialTest: View {
    var body: some View {
        ZStack(alignment : .bottom) {
            Image("image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                
            }
            
            VStack {
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.white)
                    .frame(width: 40, height: 4)
                    .padding()
                
                Text("Coordinated Universal Time (UTC) is the world time standard that regulates clocks and time. It is successor to Greenwich Mean Time (GMT). For casual use, UTC is the same as GMT, but is used by the scientific community.")
                    .padding(.horizontal)
                    .font(.headline)
                    .textSelection(.enabled)
                    
                
                Spacer()
                    
                
            }
            .frame(height: 250)
            .frame(width: UIScreen.screenWidth)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.thinMaterial)
                    .ignoresSafeArea()
                
                
            )
            
            

        }
    }
}

#Preview {
    BackgroundMaterialTest()
}
