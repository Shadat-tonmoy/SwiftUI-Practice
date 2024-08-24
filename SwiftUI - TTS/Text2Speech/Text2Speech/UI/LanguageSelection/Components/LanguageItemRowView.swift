//
//  LanguageItemRowView.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/8/24.
//

import SwiftUI

struct LanguageItemRowView: View {
    
    let language : LanguageModel
    
    let selectionCallback : (_ language : LanguageModel) -> Void
    
    var body: some View {
        HStack {
            
            Text(language.getCountryFlag())
                .font(.system(size: 50))
            
            
            VStack(alignment : .leading) {
                Text(language.getLanguageName().capitalized)
                Text(language.getCountryName().capitalized)
                    .font(.caption)
            }
            
            Spacer()
            
            Image(systemName: KImages.RightIcon)
                .resizable()
                .foregroundStyle(.gray)
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(.horizontal,15)
                .padding(.top,5)
            
        } // MARK: LANGUAGE SECTION - END
//        .padding(.top)
//        .padding(.horizontal,5)
        .onTapGesture {
            selectionCallback(language)
        }
    }
}

#Preview {
    LanguageItemRowView(language: LanguageModel(localeCode: "pl-PL")) { language in
        
    }
}
