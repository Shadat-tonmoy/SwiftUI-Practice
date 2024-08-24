//
//  LanguageListScreenView.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/8/24.
//

import SwiftUI

struct LanguageListScreenView: View {
    
    @StateObject private var viewModel = LanguageListViewModel()
    @Environment(\.dismiss) var dismiss
    
    let selectionCallback : (_ language : LanguageModel) -> Void
    
    var body: some View {
        VStack {
            
            LanguageSelectionScreenNavbarView()
            
            List(viewModel.languages, rowContent: { language in
                LanguageItemRowView(language: language) { selectedLanguage in
                    selectionCallback(selectedLanguage)
                    dismiss()
                }
            })
            .listStyle(.plain)
            .onAppear {
                viewModel.fetchSupportedLanguages()
                
            }
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
//    EmptyView()
    LanguageListScreenView(selectionCallback: { language in
        
    })
}
