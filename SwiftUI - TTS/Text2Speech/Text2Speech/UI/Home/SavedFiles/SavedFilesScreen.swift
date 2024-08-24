//
//  SavedFilesScreen.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 22/8/24.
//

import SwiftUI

struct SavedFilesScreen: View {
    
    init() {
        print("SavedFileScreen init")
    }
    
    var body: some View {
        VStack() {
            
            HomeScreenNavbarView()
            
            ScrollView {
                VStack {
                    Image(systemName: KImages.SavedFilesIcon)
                        .font(.title)
                    Text("Saved Files Will Show Here...")
                        .font(.title)
                }
            }
            
            
                
        }
    }
}

#Preview {
    SavedFilesScreen()
}
