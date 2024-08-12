//
//  MoreOptionScreen.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 12/8/24.
//

import SwiftUI

struct MoreOptionScreen: View {
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea()
            VStack {
                Text("More Screen")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    MoreOptionScreen()
}
