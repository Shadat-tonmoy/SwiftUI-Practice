//
//  TextToSpeechScreen.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 19/8/24.
//

import SwiftUI

struct TextToSpeechScreen: View {
    var body: some View {
        ZStack {
            VStack {
                NavbarView()
                
                ScrollView {
                    HomeScreenInputView()
                    
                    ControlAudioView()
                }
            }
            
        }
    }
}

#Preview {
    TextToSpeechScreen()
}


