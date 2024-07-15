//
//  TestGradient.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 7/7/24.
//

import SwiftUI

struct TestGradient: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(colors: [Color("GradientStart"),Color("GradientEnd")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 250, height: 150)
            
            RoundedRectangle(cornerRadius: 24)
                .fill(RadialGradient(colors: [Color("GradientStart"), Color("GradientEnd")], center: .center, startRadius: 50, endRadius: 120))
                .frame(width: 250, height: 150)
                .padding(10)
                
        }
    }
}

#Preview {
    TestGradient()
}
