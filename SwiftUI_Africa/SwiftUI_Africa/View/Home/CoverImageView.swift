//
//  CoverImageView.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages : [CoverImageModel] = Bundle.main.decode("covers.json")
    var body: some View {
        TabView {
            
            ForEach(coverImages, id: \.id) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
            
        }.tabViewStyle(.page)
            
    }
}

#Preview {
    CoverImageView()
}
