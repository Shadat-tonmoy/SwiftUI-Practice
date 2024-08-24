//
//  RecentScreenView.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 22/8/24.
//

import SwiftUI

struct RecentScreenView: View {
    
    init() {
        print("RecentScreen init")
    }
    
    var body: some View {
        VStack {
            
            HomeScreenNavbarView()
            
            ScrollView {
                VStack {
                    Image(systemName: KImages.RecentIcon)
                        .font(.title)
                    Text("Recent Files Will Show Here...")
                        .font(.title)
                }
            }
            
            
            
                
        }
        
    }
}

#Preview {
    RecentScreenView()
}
