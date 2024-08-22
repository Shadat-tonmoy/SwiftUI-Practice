//
//  PlaySoundTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 19/8/24.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    private init(){
        
    }
    
    var audioPlayer : AVAudioPlayer? = nil
    
    func playAudio(soundOption : SoundOption) {
        
        guard let url = Bundle.main.url(forResource: soundOption.rawValue, withExtension: ".mp3") else {
            print("Invalid audio url!")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            print("Error while playing : \(error.localizedDescription)")
            
        }
        
        
    }
    
}

enum SoundOption : String{
    case cow = "cow-moo"
    case duck = "duck-quack"
}

struct PlaySoundTest: View {
    var body: some View {
        VStack {
            Button {
                print("Will play sound 1")
                SoundManager.instance.playAudio(soundOption: .cow)
            } label: {
                Text("Play Cow Sound")
                    .padding()
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.purple)
                    )
            }
            
            Button {
                print("Will play sound 2")
                SoundManager.instance.playAudio(soundOption: .duck)
            } label: {
                Text("Play Duck Sound")
                    .padding()
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.purple)
                    )
            }

        }
        .navigationTitle("Play Sound!")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PlaySoundTest()
}
