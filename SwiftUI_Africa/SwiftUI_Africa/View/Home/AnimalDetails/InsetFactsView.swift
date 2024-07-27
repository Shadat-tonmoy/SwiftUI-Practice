//
//  InsetFactsView.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI

struct InsetFactsView: View {
    
    let animal : AnimalModel
    
    var body: some View {
        
        GroupBox {
            TabView {
                ForEach(animal.fact, id : \.self) { item in
                    Text(item)
                        .font(.headline)
                }
            }
            .tabViewStyle(.page)
        }
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    InsetFactsView(animal: animals[0])
}
