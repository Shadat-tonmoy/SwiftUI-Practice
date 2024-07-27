//
//  AnimalListItemRow.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI

struct AnimalListItemRow: View {
    
    let animal : AnimalModel
    
    var body: some View {
        HStack(spacing : 12) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack (alignment : .leading, spacing: 8){
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing)
            }
        }
    }
}

#Preview {
    AnimalListItemRow(animal: animals[0])
}
