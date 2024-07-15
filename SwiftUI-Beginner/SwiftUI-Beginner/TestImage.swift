//
//  TestImage.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 7/7/24.
//

import SwiftUI

struct TestImage: View {
    var body: some View {
        
        VStack{
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 150)
                .cornerRadius(30)
                
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.orange)
                .frame(width: 200, height: 150)
            
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .cornerRadius(100)
            
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
            
            
        }
        
            
    }
}

#Preview {
    TestImage()
}
