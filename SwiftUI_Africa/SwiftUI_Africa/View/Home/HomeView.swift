//
//  HomeView.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            
            List {
                CoverImageView()
                    .frame(height: 300)
                    .padding(.horizontal,-20)
                
                ForEach(animals, id: \.id) { item in
                    NavigationLink(destination: {
                        AnimalDetailsView(animal: item)
                        
                    }, label: {
                        AnimalListItemRow(animal: item)
                    })
                }
            }
            
            .listStyle(.plain)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .navigationTitle("Africa")
            
        }
        
        
        
        
        
        
    }
}

#Preview {
    HomeView()
}
