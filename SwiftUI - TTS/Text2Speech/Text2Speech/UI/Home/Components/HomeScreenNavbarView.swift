//
//  NavbarView.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 19/8/24.
//

import SwiftUI

struct HomeScreenNavbarView: View {
    var body: some View {
        HStack {
            Image(systemName: KImages.HamburgerIcon)
                .foregroundStyle(.white)
                .font(.system(size: 20))
                .padding(.horizontal)
            
            Spacer()
            
            Text(KStrings.Text2Speech)
                .foregroundStyle(.white)
            
            Spacer()
            
            Image(systemName: KImages.PremiumIcon)
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
    HomeScreenNavbarView()
}
