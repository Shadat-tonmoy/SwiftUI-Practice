//
//  AnimalDetailsView.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI

struct AnimalDetailsView: View {
    
    let animal : AnimalModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center,spacing: 20) {
                    // HERO IMAGE
                    Image(animal.image)
                        .resizable()
                        .scaledToFill()
                    
                    // TITLE
                    Text(animal.name.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.primary)
                        .padding(.vertical,8)
                        .background(
                            Rectangle()
                                .fill(.accent)
                                .frame(height: 6)
                                .offset(y : 24)
                        )
                    
                    // HEADLINE
                    Text(animal.headline)
                        .foregroundStyle(.accent)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    // GALLERY
                    
                    GroupBox {
                        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in picture")
                    }
                    
                    InsetGalleryView(animal: animal)
                        .padding(.horizontal)
                    
                    // FACTS
                    
                    GroupBox {
                        HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    }
                    
                    InsetFactsView(animal: animal)
                        .padding(.horizontal)
                    
                    // DESCRIPTIONS
                    
                    GroupBox {
                        HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    }
                    
                    Text(animal.description)
                        .padding(.horizontal)
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                    
                    
                    // MAP
                    
                    GroupBox {
                        HeadingView(headingImage: "map", headingText: "National Parks")
                    }
                    InsetMapView()
                        .padding(.horizontal)
                    
                    // LINK
                    ExternalWebLinkView(animal: animal)
                        .padding(.horizontal)
                    
                }
            }
            .navigationTitle("Learn more about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        AnimalDetailsView(animal: animals[0])
    }
    
}
