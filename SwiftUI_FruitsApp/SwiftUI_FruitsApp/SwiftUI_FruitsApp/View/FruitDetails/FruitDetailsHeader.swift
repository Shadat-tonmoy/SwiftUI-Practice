//
//  FruitDetailsHeader.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct FruitDetailsHeader: View {
    let fruit : Fruit
    var body: some View {
        Image(fruit.image)
            .resizable()
            .scaledToFit()
            .padding(.top,50)
            .background(
                LinearGradient(colors: fruit.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
            
            )
    }
}

#Preview {
    FruitDetailsHeader(fruit: fruits[0])
}
