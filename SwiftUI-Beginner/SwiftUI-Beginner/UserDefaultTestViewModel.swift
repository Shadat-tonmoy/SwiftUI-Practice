//
//  UserDefaultTestViewModel.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 30/7/24.
//

import Foundation


class UserDefaultTestViewModel : ObservableObject {
    
    @Published var userName : String = ""
    
    let userNameKey = "user_name"
    
    func saveUserNameToCache() {
        print("saveUserNameToCache : \(userName)")
        UserDefaults.standard.setValue(userName, forKey: userNameKey)
    }
    
    func getUserNameFromCache() {
        let userNameFromCache = UserDefaults.standard.string(forKey: userNameKey)
        self.userName = userNameFromCache ?? ""
        print("getUserNameFromCache :\(userNameFromCache)")
    }
    
}
