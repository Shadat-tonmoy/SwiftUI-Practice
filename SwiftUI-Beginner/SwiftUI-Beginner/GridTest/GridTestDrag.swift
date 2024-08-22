//
//  GridTestDrag.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 14/8/24.
//

import SwiftUI

struct GridTestDrag: View {
    @State var xOffset = 0.0
    @State var yOffset = 0.0
    var body: some View {
        VStack {
            ScrollView(.horizontal,showsIndicators: true) {
                HStack {
                    Text("Hello")
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 200, height: 100)
                        .offset(x : xOffset, y : yOffset)
                        .gesture(
                            DragGesture(minimumDistance: 5.0)
                                .onChanged { value in
                                    
                                    print("onChanged value : \(value.translation), xOffSet : \(xOffset), location : \(value.location), startLocation : \(value.startLocation)")
                                    
                                    withAnimation(.spring) {
                                        let xChange = value.translation.width
                                        let xDiff = xChange - xOffset
                                        print("xDiff : \(xDiff)")
                                        
                                        xOffset += xDiff
//                                        yOffset = value.translation.height
                                    }
                                }
                                .onEnded { value in
                                    withAnimation(.spring) {
//                                        xOffset = 0.0
//                                        yOffset = 0.0
                                    }
                                    print("OnEnded value : \(value.translation)")
                                    
                                }
                        
                    )
                }
                .frame(width: 1500, alignment: .leading)
                
            }
        }
    }
}

#Preview {
    GridTestDrag()
}
