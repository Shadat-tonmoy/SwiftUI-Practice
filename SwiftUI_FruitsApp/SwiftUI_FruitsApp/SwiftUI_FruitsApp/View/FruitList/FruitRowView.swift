//
//  FruitRowView.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct FruitRowView: View {
    
    let fruit : Fruit
    
    var body: some View {
        HStack {
            Image(fruit.image)
                .renderingMode(.original)
                .resizable()
                .frame(width: 80,height: 80, alignment: .center)
                .scaledToFill()
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 3, x : 2, y : 2)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom)
                        )
                
                )
            VStack(alignment : .leading ,spacing : 5) {
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(fruit.headline)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            Spacer()
        }
        
    }
}

#Preview {
    FruitRowView(fruit: fruits[0])
        .previewLayout(.sizeThatFits)
}
