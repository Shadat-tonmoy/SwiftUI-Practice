//
//  NavbarView.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 19/8/24.
//

import SwiftUI

struct NavbarView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .foregroundStyle(.white)
                .font(.system(size: 20))
                .padding(.horizontal)
            
            Spacer()
            
            Text("Text2Speech")
                .font(.title3)
                .foregroundStyle(.white)
            
            Spacer()
            
            Image(systemName: "crown.fill")
                .foregroundStyle(.orange)
                .font(.system(size: 20))
                .padding(.horizontal)
            
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(KColors.ColorPrimary)
    }
    
    
}

#Preview {
    NavbarView()
}
