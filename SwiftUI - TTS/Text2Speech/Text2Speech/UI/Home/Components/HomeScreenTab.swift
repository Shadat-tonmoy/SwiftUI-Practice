//
//  HomeScreenTab.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 21/8/24.
//

import SwiftUI

enum Tab: String {
    case home = "house.fill"
    case recent = "clock.fill"
    case savedFiles = "doc.fill"
    case settings = "gearshape.fill"
    
    var title: String {
        switch self {
        case .home:
            return "TTS"
        case .recent:
            return "Recent"
        case .savedFiles:
            return "Saved Files"
        case .settings:
            return "Settings"
        }
    }
    
    var icon : String {
        switch self {
        case .home:
            return KImages.HomeIcon
        case .recent:
            return KImages.RecentIcon
        case .savedFiles:
            return KImages.SavedFilesIcon
        case .settings:
            return KImages.SettingsIcon
        }
    }
}


struct HomeScreenTab: View {
    @State private var currentTab: Tab = .home
    @EnvironmentObject private var screenNavigator : ScreenNavigator
    
    // MARK: - Hide Tab Bar
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    //    var textToSpeechScreen = TextToSpeechScreen()
    
    var body: some View {
        TabView(selection: $currentTab) {
            TextToSpeechScreen()
                .tag(Tab.home)
            RecentScreenView()
                .tag(Tab.recent)
            SavedFilesScreen()
                .tag(Tab.savedFiles)
            SettingsScreen()
                .tag(Tab.settings)
        }
        .environmentObject(screenNavigator)
        .overlay(alignment: .bottom, content: {
            TabOverlayView
        })
        
        
    }
    
    @ViewBuilder
    func TabButton(_ tab: Tab)-> some View {
        Button {
            withAnimation {
                currentTab = tab
            }
        } label: {
            VStack {
                Image(systemName: tab.icon)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(currentTab == tab ? KColors.ColorPrimary : Color.gray.opacity(0.5))
                    .frame(maxWidth: .infinity)
                
                Text(tab.title)
                    .font(.caption)
                    .lineLimit(1)
                    .foregroundColor(currentTab == tab ? KColors.ColorPrimary : Color.gray.opacity(0.5))
                
            }
        }
    }
    
    
    var TabOverlayView : some View {
        // MARK: - Curve Tab Bar
        
        HStack(spacing: 0) {
            
            // MARK: - Tab Button
            
            TabButton(.home)
            TabButton(.recent)
            
            // MARK: - Center Button
            
            Button(action: {
                
            }, label: {
                Image(systemName: "speaker.wave.2.fill")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .offset(x: -1)
                    .padding(18)
                    .foregroundColor(Color.white)
                    .background(KColors.ColorPrimary)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
            })
            .offset(y: -25)
            
            TabButton(.savedFiles)
            
            TabButton(.settings)
        }
        .background(
            KColors.BottomTabBG
                .clipShape(CustomCurveShape())
                .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                .ignoresSafeArea(.container, edges: .bottom)
        )
    }
}

#Preview {
    HomeScreenTab()
        .environmentObject(ScreenNavigator())
}
