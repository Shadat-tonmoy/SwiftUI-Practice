//
//  SwiftUI_FruitsAppApp.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

@main
struct SwiftUI_FruitsAppApp: App {
    
    @AppStorage(IS_ONBOARDING) private var isOnboarding : Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                FruitListScreen()
            }
            
        }
    }
}
