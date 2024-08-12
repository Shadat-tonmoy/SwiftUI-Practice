//
//  AsyncImageTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 30/7/24.
//

import SwiftUI

struct AsyncImageTest: View {
    
    var imageUrl = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            AsyncImage(url: imageUrl)
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
            }

        }
    }
}

#Preview {
    AsyncImageTest()
}
