//
//  NSCacheTestView.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 5/9/24.
//

import SwiftUI

struct NSCacheTestView: View {
    
    
    @StateObject var viewModel = NSCacheTestViewModel()
    let imageModifier = ImageModifier()
    
    var body: some View {
        ScrollView {
            VStack {
                if let image = viewModel.image {
                    VStack {
                        Text("Original Image")
                            .font(.headline)
                        Image(uiImage: image)
                            .resizable()
                            .modifier(imageModifier)
                        
                    }
                }
                
                Text(viewModel.infoMessage)
                    .font(.headline)
                    .padding()
                
                HStack {
                    Button(action: {
                        viewModel.saveToCache()
                    }, label: {
                        Text("Save To Cache")
                            .modifier(ButtonModifier(fillColor: .purple))
                    })
                    
                    
                    Button(action: {
                        viewModel.removeImageFromCache()
                    }, label: {
                        Text("Delete From Cache")
                            .modifier(ButtonModifier(fillColor: .red))
                        
                    })
                }
                
                HStack {
                    Button(action: {
                        viewModel.getImageFromCache()
                    }, label: {
                        Text("Get From Cache")
                            .modifier(ButtonModifier(fillColor: .blue))
                        
                    })
                }
                
                if let cachedImage = viewModel.cachedImage {
                    VStack {
                        Text("Cached Image")
                            .font(.headline)
                        
                        Image(uiImage: cachedImage)
                            .resizable()
                            .modifier(imageModifier)
                    }
                }
            }
            .navigationTitle("NSCacheManager")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct ImageModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 250, height: 250)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 5))
        
    }
}

struct ButtonModifier : ViewModifier {
    
    let fillColor : Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(fillColor)
            )
    }
}

#Preview {
    NSCacheTestView()
}
