//
//  ExternalWebLinkView.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    let animal : AnimalModel
    
    var body: some View {
        GroupBox {
            HStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                
                Text("Wikipedia")
                
                Spacer()
                
                Image(systemName: "arrow.up.right.square")
                    .foregroundStyle(.accent)
                
                Link(animal.name, destination: URL(string: animal.link)!)
            }
        }
    }
}

#Preview {
    ExternalWebLinkView(animal: animals[0])
}
