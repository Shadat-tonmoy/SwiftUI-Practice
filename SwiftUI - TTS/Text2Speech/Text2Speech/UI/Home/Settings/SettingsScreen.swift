//
//  SettingsScreen.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 22/8/24.
//

import SwiftUI

struct SettingsScreen: View {
    
    init() {
        print("SavedFileScreen init")
    }
    
    var body: some View {
        VStack() {
            
            HomeScreenNavbarView()
            
            ScrollView {
                VStack {
                    Image(systemName: KImages.SettingsIcon)
                        .font(.title)
                    Text("Settings Options Here...")
                        .font(.title)
                }
            }
            
                
        }
    }
}

#Preview {
    SettingsScreen()
}
