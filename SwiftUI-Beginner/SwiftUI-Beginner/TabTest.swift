//
//  TabTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 18/7/24.
//

import SwiftUI

struct TabTest: View {
    @State var color : Color = .teal
    
    @State var selectedTab : Int = 0
    
    var body: some View {
        
        
        TabView (selection : $selectedTab){
            HomeTabView(color: $color, selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            BrowseTabView(color: $color, selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            
            ProfileTabView(color: $color, selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
        }
        .onChange(of: selectedTab, {
            if selectedTab == 0 {
                color = .teal
            } else if selectedTab == 1 {
                color = .purple
            } else if selectedTab == 2 {
                color = .blue
            }
            
        })
        .onAppear {
//            print("Appeared")
            
        }
        .tint(color)
        
    }
}


struct HomeTabView : View {
    
    @Binding var color : Color
    @Binding var selectedTab : Int
    
    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.top)
            
            VStack{
                Text("Hello From Home")
                    .font(.title)
                    .foregroundStyle(.white)
                
                MoveToButton(text: "Browser Menu", action: {
                    selectedTab = 1
                })
                
                MoveToButton(text: "Profile Menu", action: {
                    selectedTab = 2
                })
            }
        }
    }
}


struct BrowseTabView : View {
    
    @Binding var color : Color
    @Binding var selectedTab : Int
    
    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.top)
            VStack{
                Text("Hello From Browse")
                    .font(.title)
                    .foregroundStyle(.white)
                
                MoveToButton(text: "Home Menu", action: {
                    selectedTab = 0
                })
                
                MoveToButton(text: "Profile Menu", action: {
                    selectedTab = 2
                })
            }
        }
    }
}


struct ProfileTabView : View {
    
    @Binding var color : Color
    @Binding var selectedTab : Int
    
    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.top)
            VStack{
                Text("Hello From Profile")
                    .font(.title)
                    .foregroundStyle(.white)
                
                MoveToButton(text: "Home Menu", action: {
                    selectedTab = 0
                })
                
                MoveToButton(text: "Browser Menu", action: {
                    selectedTab = 1
                })
            }
        }
    }
}

struct MoveToButton : View {
    var text : String
    var action : () -> Void
    var body: some View {
        Button(action: action, label: {
            Text(text)
                .padding()
                .padding(.horizontal,40)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
            
            )
        })
    }
}






#Preview {
    TabTest()
}
