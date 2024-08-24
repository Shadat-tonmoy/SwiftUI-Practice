//
//  LanguageModel.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/8/24.
//

import Foundation

class LanguageModel : Identifiable {
    
    let id : String = UUID().uuidString
    let localeCode : String
    
    init(localeCode: String) {
        self.localeCode = localeCode
    }
    
    func getCountryName() -> String {
        let dashIndex = localeCode.lastIndex(of: "-") ?? localeCode.startIndex
        let countryCodeIndex = localeCode.index(after: dashIndex)
        let countryCode = localeCode[countryCodeIndex...].uppercased()
        return Utils.getCountryName(countryCode: countryCode)
    }
    
    func getCountryFlag() -> String {
        let dashIndex = localeCode.lastIndex(of: "-") ?? localeCode.startIndex
        let flagCodeIndex = localeCode.index(after: dashIndex)
        let flagCode = localeCode[flagCodeIndex...].uppercased()
        let flag = Utils.getFlagForCountry(country: flagCode)
        return flag
    }
    
    func getLanguageName() -> String {
        let locale = Locale(identifier: localeCode)
        return locale.localizedString(forLanguageCode: locale.identifier)?.capitalized ?? ""
    }
    
    func isValidLanguage() -> Bool {
        let dashIndex = localeCode.lastIndex(of: "-") ?? localeCode.startIndex
        let countryCodeIndex = localeCode.index(after: dashIndex)
        let countryCode = localeCode[countryCodeIndex...].uppercased()
        let isOnlyLetters = countryCode.allSatisfy { $0.isLetter }
        return isOnlyLetters
        
    }
    
}
