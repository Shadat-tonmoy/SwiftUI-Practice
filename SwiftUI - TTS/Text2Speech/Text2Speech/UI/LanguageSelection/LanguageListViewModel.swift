//
//  LanguageListViewModel.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/8/24.
//

import Foundation
import AVFoundation


class LanguageListViewModel : ObservableObject {
    
    @Published var languages : [LanguageModel] = []
    
    func fetchSupportedLanguages() {
        
        let voices = AVSpeechSynthesisVoice.speechVoices()
        var allLanguages : [LanguageModel] = []
        var foundMap : [String:Bool] = [:]
        
        for voice in voices {
            let localeCode = voice.language
            let languageModel = LanguageModel(localeCode: localeCode)
            let alreadyExists = foundMap.keys.contains(localeCode)
            if(!alreadyExists && languageModel.isValidLanguage()){
                allLanguages.append(languageModel)
                foundMap[localeCode] = true
            }
        }
        self.languages = allLanguages
    }
    
    func getSpeechSupportedLanguages() -> [String] {
        let voices = AVSpeechSynthesisVoice.speechVoices()
        var languages: Set<String> = []
        let english = Locale(identifier: "en")
        voices.forEach{languages.insert(english.localizedString(forLanguageCode: $0.language)!)}
        return Array(languages).sorted()
    }
}
