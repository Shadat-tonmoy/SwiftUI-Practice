//
//  MainView.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }
                .tag(Tags.HOME_TAB)
            
            VideoListView()
                .tabItem {
                    Text("Videos")
                    Image(systemName: "play.rectangle")
                }
                .tag(Tags.VIDEO_LIST_TAB)
            
            MapView()
                .tabItem {
                    Text("Location")
                    Image(systemName: "map")
                }
                .tag(Tags.MAP_TAB)
            
            GalleryView()
                .tabItem {
                    Text("Gallery")
                    Image(systemName: "photo.fill")
                    
                }
                .tag(Tags.GALLERY_TAB)
            
        }
    }
}

#Preview {
    MainView()
}
