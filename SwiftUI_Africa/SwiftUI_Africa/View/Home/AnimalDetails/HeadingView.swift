//
//  HeadingView.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI

struct HeadingView: View {
    let headingImage : String
    let headingText : String
    
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
            
        
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in picture")
}
