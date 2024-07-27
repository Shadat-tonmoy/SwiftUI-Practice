//
//  FruitDetailsView.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct FruitDetailsView: View {
    
    let fruit : Fruit
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                VStack(alignment : .center, spacing: 20) {
                    
                    // HEADING IMAGE
                    FruitDetailsHeader(fruit: fruit)
                    
                    
                    VStack(alignment : .leading, spacing: 20) {
                        
                        // TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .foregroundStyle(fruit.gradientColors[1])
                        .fontWeight(.heavy)
                        
                        
                        // HEADING
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // NUTRIENTS
                        FruitNutrientView(fruit: fruit)
                        
                        
                        // SUB-HEADING
                        Text("Learn More About \(fruit.title.uppercased())")
                            .fontWeight(.bold)
                            .foregroundStyle(fruit.gradientColors[1])
                        
                        
                        // DESCRIPTION
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        
                        // LINK
                        FruitLinkView()
                            .padding(.top,10)
                            .padding(.bottom, 40)
                    }
                    .frame(maxWidth: 640, alignment: .leading)
                    .padding(.horizontal)
                    
                }
                
            }
            .ignoresSafeArea(edges : .top)
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FruitDetailsView(fruit: fruits[0])
}
