//
//  OnboardingView.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView{
            ForEach(0 ..< 5) { item in
                FruitCardView(fruit: fruits[item])
            }
        
            
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
