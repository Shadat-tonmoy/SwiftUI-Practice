//
//  GridTestMagnification.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 14/8/24.
//

import SwiftUI

struct GridTestMagnification: View {
    
    @State private var scaleAmount = 1.0
    @State private var testText = "N/A"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello : \(testText)")
                    .padding(40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.indigo)
                            
                    )
                    .scaleEffect(1 + scaleAmount)
                    .padding(50)
                    .gesture(
                        MagnificationGesture()
                            .onChanged{ value in
                                print("Magnification value : \(value)")
                                scaleAmount = value - 1
                            }
                            .onEnded{ value in
                                print("Magnification ended at : \(value)")
                                withAnimation(.spring, {
                                    scaleAmount = 0
                                })
                                
                            }
                    )
            }
        }
//        .navigationTitle("Back")
        
    }
}

#Preview {
    GridTestMagnification()
}
