//
//  NavigationStackWithPathBinding.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/8/24.
//

import SwiftUI

struct NavigationStackWithPathBinding: View {
    
    @State var paths : [NavPath] = []
    
    var body: some View {
        NavigationStack(path: $paths, root: {
            ZStack {
                Color.orange
                    .ignoresSafeArea()
                
                VStack {
                    HStack(spacing : 10){
                       
                        HomeScreenButton(iconName: "house.fill", title: "Home")
                            .onTapGesture {
                                paths.append(.HOME)
                                
                            }
                        
                        
                        HomeScreenButton(iconName: "video.fill", title: "Convert")
                            .onTapGesture {
                                paths.append(.CONVERT)
                            
                            }
                        
                        
                        HomeScreenButton(iconName: "rectangle.portrait.and.arrow.right.fill", title: "Output")
                            .onTapGesture {
                                paths.append(.OUTPUT)
                                
                            }
                        
                    }
                    
                    HStack{
                        
                    }
                }
            }
            .navigationDestination(for: NavPath.self, destination: { path in
                switch path {
                    case .HOME:
                        NavigationStackHome()
                    case .CONVERT:
                        NavigationStackConvert()
                    case .OUTPUT:
                        NavigationStackOutput()
                }
                
            })
        })
        
        
    }
}

#Preview {
    NavigationStackWithPathBinding()
}

struct HomeScreenButton: View {
    let iconName : String
    let title : String
    var body: some View {
        VStack(spacing : 10) {
            Image(systemName: iconName)
                .foregroundStyle(.orange)
                .font(.title)
            
            
            Text(title)
                .foregroundStyle(.orange)
        }
        .frame(minHeight: 70)
        .padding()
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(radius: 8, x : 5, y : 2)
        )
    }
}
