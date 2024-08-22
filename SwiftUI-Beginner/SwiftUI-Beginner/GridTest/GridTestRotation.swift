//
//  GridTestRotation.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 14/8/24.
//

import SwiftUI

struct GridTestRotation: View {
    
    @State var rotationAngle = Angle(degrees: 0.0)
    
    var body: some View {
        VStack {
            Text("Rotation")
                .padding(40)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.indigo)
                )
                .rotationEffect(rotationAngle)
                .gesture(
                    RotateGesture()
                        .onChanged{ value in
                            print("Value : \(value.rotation.degrees)")
                            rotationAngle = value.rotation
                            
                        }
                        .onEnded { value in
                            withAnimation(.spring) {
                                print("OnEnded : value : \(value.rotation.degrees)")
                                rotationAngle = .zero
                            }
                            
                        }
                )
        }
    }
}

#Preview {
    GridTestRotation()
}
