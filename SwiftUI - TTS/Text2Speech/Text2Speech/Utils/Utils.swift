//
//  Utils.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 20/8/24.
//

import Foundation
import SwiftUI


class Utils {
    
    static func getFlagForCountry(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    static func getCountryName(countryCode : String) -> String {
        let locale = Locale(identifier: countryCode)
        return locale.localizedString(forRegionCode: countryCode)?.capitalized ?? "N/A"
    }
    
}
