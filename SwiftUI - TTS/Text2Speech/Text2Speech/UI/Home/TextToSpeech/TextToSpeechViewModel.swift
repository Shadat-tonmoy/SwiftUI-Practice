//
//  TextToSpeechViewModel.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/8/24.
//

import Foundation
import AVFoundation


class TextToSpeechViewModel : ObservableObject {
    
    
    @Published var selectedLanguage : LanguageModel = LanguageModel(localeCode: KStrings.DefualtLanguage)
    
    @Published var inputText : String = ""
    
    func updateSelectedLanguage(language : LanguageModel) {
        self.selectedLanguage = language
    }
    
    
}
