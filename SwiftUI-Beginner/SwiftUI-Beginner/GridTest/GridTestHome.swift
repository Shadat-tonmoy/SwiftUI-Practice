//
//  GridTestHome.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 14/8/24.
//

import SwiftUI

struct GridTestHome: View {
    
    
    //    @State var otherScreen = false
    
    @EnvironmentObject var screenNavigator : ScreenNavigator
    
    let gridColums = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            //            Image("background")
            //                .resizable()
            //                .scaledToFill()
            //                .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            //            //
            //            Color.black.opacity(0.6)
            //                .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            
            ScrollView {
                
                LazyVGrid(columns: gridColums, spacing: 20, content: {
                    GridItemButton(iconName: "eraser.fill", title: "Magnification Gesture")
                    
                        .onTapGesture {
                            screenNavigator.openMagnificationGestureScreen()
                        }
                    
                    GridItemButton(iconName: "pencil.circle.fill", title: "Rotation Gesture")
                        .onTapGesture {
                            screenNavigator.openRotateGestureScreen()
                            
                        }
                    
                    GridItemButton(iconName: "pencil.tip.crop.circle.fill", title: "Drag Gesture ")
                        .onTapGesture {
                            screenNavigator.openDragGestureScreen()
                        }
                    
                    
                    
                    GridItemButton(iconName: "folder.fill", title: "Long Tap Gesture")
                    
                    GridItemButton(iconName: "scribble.variable", title: "Scroll View Reader")
                        .onTapGesture {
                            screenNavigator.openScrollViewReaderScreen()
                        }
                    
                    GridItemButton(iconName: "lasso.badge.sparkles", title: "Geometry Reader")
                        .onTapGesture {
                            screenNavigator.openGeometryReaderScreen()
                        }
                    
                    GridItemButton(iconName: "doc.zipper", title: "Mask")
                        .onTapGesture {
                            screenNavigator.openMaskScreen()
                        }
                    
                    GridItemButton(iconName: "music.note", title: "Play sound")
                        .onTapGesture {
                            screenNavigator.openPlaySoundScreen()
                        }
                    
                    GridItemButton(iconName: "note", title: "Hashable")
                        .onTapGesture {
                            screenNavigator.openHashableScreen()
                        }
                    
                    GridItemButton(iconName: "note", title: "Search Sort")
                        .onTapGesture {
                            screenNavigator.openSearchSortScreen()
                        }
                    
                    GridItemButton(iconName: "rectangle.fill.on.rectangle.fill", title: "Core Data")
                        .onTapGesture {
                            screenNavigator.openCoreDataTestScreen()
                        }
                    
                    GridItemButton(iconName: "globe", title: "Networking")
                        .onTapGesture {
                            screenNavigator.openNetworkingTestScreen()
                        }
                    
                })
                
            }
            .padding(.top,20)
            .padding(.horizontal,5)
            
            
            
            
            
        }
        .onAppear {
            //            screenNavigator.otherScreen = false
        }
        //        .navigationTitle(screenNavigator.otherScreen ? "Back" : "SwiftUI - Advanced")
        .navigationTitle("Home")
        //        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading, content: {
                Image(systemName: "line.3.horizontal.decrease")
                    .onTapGesture {
                        
                    }
            })
            
            ToolbarItem(placement: .topBarTrailing, content: {
                Image(systemName: "crown.fill")
                    .font(.system(size: 16))
                    .onTapGesture {
                        
                    }
            })
        }
    }
}

struct GridItemButton: View {
    let iconName : String
    let title : String
    var body: some View {
        VStack(spacing : 10) {
            Image(systemName: iconName)
                .foregroundStyle(.white)
                .font(.title)
            
            
            Text(title)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
        }
        .frame(minHeight: 120)
        .frame(minWidth: 120)
        .padding()
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 10)
            //                .fill(.black.opacity(0.25))
                .fill(Color.getRandomGradientBackground())
                .shadow(radius: 8, x : 5, y : 2)
        )
    }
}

#Preview {
    GridTestHome()
}
