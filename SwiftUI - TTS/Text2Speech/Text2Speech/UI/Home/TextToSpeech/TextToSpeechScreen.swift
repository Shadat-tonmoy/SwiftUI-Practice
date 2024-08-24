//
//  TextToSpeechScreen.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 19/8/24.
//

import SwiftUI

struct TextToSpeechScreen: View {
    
    @StateObject private var viewModel = TextToSpeechViewModel()
    
    init() {
        print("TextToSpeechScreen init")
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                HomeScreenNavbarView()
                
                ScrollView {
                    
                    TTSInputView(viewModel: viewModel)
                    
                    ControlAudioView()
                }
            }
            
        }
        
    }
}

#Preview {
    TextToSpeechScreen()
        .environmentObject(ScreenNavigator())
}


