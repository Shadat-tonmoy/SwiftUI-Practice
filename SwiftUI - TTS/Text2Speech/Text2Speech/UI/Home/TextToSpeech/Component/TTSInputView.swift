//
//  HomeScreenInputView.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 19/8/24.
//

import SwiftUI

struct TTSInputView: View {
    
    @ObservedObject var viewModel : TextToSpeechViewModel
    @EnvironmentObject private var paths : ScreenNavigator
    
    var body: some View {
        VStack(spacing : 0) {
            HStack {
                
                Text(viewModel.selectedLanguage.getCountryFlag())
                    .font(.system(size: 50))
                
                
                NavigationLink(destination: {
                    LanguageListScreenView() { selectedLanguage in
                        viewModel.updateSelectedLanguage(language: selectedLanguage)
                    }
                    
                }, label: {
                    VStack(alignment : .leading) {
                        Text(viewModel.selectedLanguage.getLanguageName())
                        Text("\(viewModel.selectedLanguage.getCountryName()) | Default")
                            .font(.caption)
                    }
                    
                })
                .buttonStyle(PlainButtonStyle())
                
                
                Image(systemName: KImages.RightIcon)
                    .resizable()
                    .foregroundStyle(.gray)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal,15)
                    .padding(.top,5)
                
                Spacer()
                
                VStack(spacing : 10) {
                    Image(systemName: KImages.ExportIcon)
                        .resizable()
                        .foregroundStyle(.gray)
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .padding(.horizontal,5)
                    
                        .onTapGesture {
                            
                        }
                    
                    Text(KStrings.Export)
                        .font(.caption)
                }
                
                
                
            } // MARK: LANGUAGE SECTION - END
            .padding(.top)
            .padding(.horizontal,10)
            
            Divider()
                .padding(.vertical,5)
            
            // MARK: INPUT FIELD - START
            TextField(KStrings.InputHint, text: $viewModel.inputText, axis: .vertical)
                .padding(8)
                .lineLimit(5, reservesSpace: true)
            
        } // END OF INPUT HEADER
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(KColors.HomeCardBG)
        )
        .shadow(radius: 2)
        .padding(.top)
    }
}

#Preview {
    TTSInputView(viewModel: TextToSpeechViewModel())
}
