//
//  ScrollViewTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 10/7/24.
//

import SwiftUI

struct ScrollViewTest: View {
    var body: some View {
        ScrollView{
            LazyVStack(spacing : 20) {
                ForEach(0..<15){ index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 200, height: 150)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 200, height: 150)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        }
                        .padding(.vertical,5)
                        
                    })
                    
                }
                
            }
        }
        
    }
}

#Preview {
    ScrollViewTest()
}
