//
//  MaskTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 17/8/24.
//

import SwiftUI

struct MaskTest: View {
    
    @State private var rating : Int = 3
    
    var body: some View {
        VStack {
            starView
                .overlay{overlayView.mask(starView)}
            
        }
    }
    
    private var starView : some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(index < rating ? .yellow : .gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index + 1
                        }
                        
                    }
                
                
            }
        }
    }
    
    
    private var overlayView : some View {
        GeometryReader { reader in
            ZStack(alignment : .leading) {
                Rectangle()
                    .fill(.red)
                    .frame(width: reader.size.width * (CGFloat(rating)/CGFloat(5)))
            }
            //            .mask(starView)
            
        }
        .allowsHitTesting(false)
    }
}

#Preview {
    MaskTest()
}
