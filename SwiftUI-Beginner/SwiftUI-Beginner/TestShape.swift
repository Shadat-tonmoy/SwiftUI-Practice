//
//  TestShape.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 7/7/24.
//

import SwiftUI

struct TestShape: View {
    var body: some View {
        VStack{
            Circle()
                .stroke(.orange,lineWidth: 20)
                .fill(Color.blue)
                .foregroundColor(.yellow)
                .frame(width: 250, height: 100)
                .padding(24.0)
            
            
            Capsule()
                .fill(.orange)
                .stroke(.black, lineWidth: 10)
                .frame(width:250, height: 100)
                .padding(24.0)
            
            RoundedRectangle(cornerRadius: 24)
                .fill(.green)
                .stroke(.brown, lineWidth: 10)
                .frame(width: 250, height: 100)
                .padding(24.0)
                
            
        }
        
            
            
    }
}

#Preview {
    TestShape()
}
