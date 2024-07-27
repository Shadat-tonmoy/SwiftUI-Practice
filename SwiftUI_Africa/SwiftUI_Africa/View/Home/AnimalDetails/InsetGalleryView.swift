//
//  InsetGalleryView.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI

struct InsetGalleryView: View {
    
    let animal : AnimalModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment : .center, spacing: 15) {
                ForEach(animal.gallery, id : \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
        
        
    }
}

#Preview {
    InsetGalleryView(animal: animals[0])
}
