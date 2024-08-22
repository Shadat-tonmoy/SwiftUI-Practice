//
//  GeometryReaderTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 15/8/24.
//

import SwiftUI

struct GeometryReaderTest: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing : 0) {
                Rectangle()
                    .fill(.red)
                    .frame(width: geometry.size.width * 0.6666)
                
                Rectangle()
                    .fill(.blue)
    //                .frame(width: UIScreen.screenWidth * 0.6666)
            }
            
        }
        .navigationTitle("Geometry Reader")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    GeometryReaderTest()
}
