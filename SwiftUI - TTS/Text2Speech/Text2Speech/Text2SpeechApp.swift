//
//  Text2SpeechApp.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 19/8/24.
//

import SwiftUI

@main
struct Text2SpeechApp: App {
    
    @State var navigationPath = ScreenNavigator()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeScreenTab()
                    .preferredColorScheme(.dark)
                    .environmentObject(navigationPath)
            }
            
            
            
        }
    }
}
