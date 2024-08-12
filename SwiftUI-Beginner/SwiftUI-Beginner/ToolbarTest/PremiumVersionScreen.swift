//
//  PremiumVersionScreen.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 12/8/24.
//

import SwiftUI

struct PremiumVersionScreen: View {
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            VStack {
                Text("Details Of Pro Version")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    PremiumVersionScreen()
}
