//
//  FruitNutrientView.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct FruitNutrientView: View {
    
    let fruit : Fruit
    let nutrients : [String] = ["Energy","Suger","Fat","Protein","Vitamin","Minerals"]
    
    var body: some View {
        GroupBox {
            DisclosureGroup("Nutrition per 100gm of \(fruit.title)") {
                ForEach(0..<nutrients.count,id: \.self) { index in
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                                .fontWeight(.bold)
                                .foregroundStyle(fruit.gradientColors[1])
                                .padding(.horizontal,4)
                            
                            Text(nutrients[index])
                                .foregroundStyle(fruit.gradientColors[1])
                            .fontWeight(.bold)
                            
                        }
                        
                        Spacer(minLength: 20)
                        
                        Text(fruit.nutrition[index])
                            .multilineTextAlignment(.trailing)
                    }
                    .padding(.top, index == 0 ? 20 : 0)
                    
                }
            }
            
        }
        
    }
}

#Preview {
    FruitNutrientView(fruit: fruits[0])
}
