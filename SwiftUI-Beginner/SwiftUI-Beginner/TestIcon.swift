//
//  TestIcon.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 7/7/24.
//

import SwiftUI

struct TestIcon: View {
    var body: some View {
        VStack{
            Image(systemName:"square.and.arrow.up.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .font(.system(size: 80))
                .foregroundColor(.gradientEnd)
                .frame(width: 200,height: 200)
            
        }
    }
}

#Preview {
    TestIcon()
}
