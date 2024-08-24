//
//  ControlAudioView.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 20/8/24.
//

import SwiftUI

struct ControlAudioView: View {
    
    @State var pitchValue = 50.0
    @State var speedValue = 50.0
    @State var volumeValue = 50.0

    
    var body: some View {
        VStack( alignment : .leading, spacing : 0) {
            Text(KStrings.ControlAudio)
                .fontWeight(.bold)
                .padding(.vertical)
            
            
            Divider()
                .padding(.vertical,5)
            
            AudioControlOption(title: KStrings.Pitch, value: $pitchValue)
                .padding(.vertical)
            
            AudioControlOption(title: KStrings.Speed, value: $speedValue)
                .padding(.vertical)
            
            AudioControlOption(title: KStrings.Volume, value: $volumeValue)
                .padding(.vertical)
            
            
            
            
        } // END OF INPUT HEADER
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(KColors.HomeCardBG)
        )
        .shadow(radius: 2)
    }
}

#Preview {
    ControlAudioView()
}

struct AudioControlOption: View {
    
    let title : String
//    @Binding var sliderValue : Float = 0
    
    @Binding var value : Double
    
    var body: some View {
        VStack(alignment : .leading) {
            HStack(spacing : 20) {
                Text(title)
                
                Text("\(Int(value))%")
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    .fontWeight(.bold)
                    .background(RoundedRectangle(cornerRadius: 8).fill(KColors.ColorPrimary))
                    .font(.callout)
            }
            .font(.system(size: 20))
            
            Slider(value: $value, in: 0...100, step: 1.0)
        }
    }
}
