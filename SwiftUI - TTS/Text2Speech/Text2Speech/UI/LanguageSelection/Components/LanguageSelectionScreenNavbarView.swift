//
//  LanguageSelectionScreenNavbarView.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/8/24.
//

import SwiftUI

struct LanguageSelectionScreenNavbarView: View {
    
    @EnvironmentObject private var screenNavigator : ScreenNavigator
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            HStack {
                HStack(spacing : 0) {
                    Image(systemName: KImages.BackIcon)
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .padding(.leading)
                        .padding(.trailing,10)
                    
                    Text(KStrings.Back)
                        .font(.callout)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                } // MARK: BACK BUTTON - END
                .onTapGesture {
                    dismiss()
                }
            } // MARK: BG HSTACK - END
            
            HStack {
                Spacer()
                
                Text(KStrings.SelectLanguage)
                    .foregroundStyle(.white)
                
                Spacer()
            } // MARK: TITLE - END
            
            
        } // MARK: ZSTACK - END
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(KColors.ColorPrimary)
    }
}

#Preview {
    LanguageSelectionScreenNavbarView()
}
