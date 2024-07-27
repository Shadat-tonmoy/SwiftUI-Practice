//
//  StartButtonView.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct StartButtonView: View {
    
    @AppStorage(IS_ONBOARDING) private var isOnboarding : Bool = true
    
    var body: some View {
        Button(action: {
            isOnboarding = false
        }, label: {
            HStack (spacing : 12){
                
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(
                Capsule().strokeBorder(Color.white,lineWidth: 1.25)
            )
        })
        .tint(.white)
    }
}

#Preview {
    StartButtonView()
}
