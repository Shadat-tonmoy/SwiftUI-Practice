//
//  FruitCardView.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct FruitCardView: View {
    
    // MARK: - PROPERTIES
    let fruit : Fruit
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color : .black.opacity(0.15),radius: 8, x: 8, y: 6)
                
                Text(fruit.title)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text(fruit.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal,16)
                    .multilineTextAlignment(.center)
                
                StartButtonView()
                    .padding(.vertical,32)
            } // :VSTACK
        } // :ZSTACK
    }
}


// MARK: - PREVIEW
#Preview {
    FruitCardView(fruit: fruits[5])
}
