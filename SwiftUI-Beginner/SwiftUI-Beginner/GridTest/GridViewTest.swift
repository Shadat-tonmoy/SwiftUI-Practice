//
//  GridViewTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 14/8/24.
//

import SwiftUI

struct GridViewTest: View {
    
    
    @State private var paths : [GridTestPath] = []
    
    @StateObject private var screenNavigator = ScreenNavigator()
    
    var body: some View {
        NavigationStack(path: $screenNavigator.paths) {
            VStack {
                GridTestHome()
            }
            .navigationDestination(for: GridTestPath.self, destination: { path in
                switch path {
                case .magnification:
                    GridTestMagnification()
                case .rotation:
                    GridTestRotation()
                case .drag:
                    GridTestDrag()
                case .scrollViewReader:
                    ScrollViewReaderTest()
                case .geometryReader:
                    GeometryReaderTest()
                case .mask:
                    MaskTest()
                case .playSound:
                    PlaySoundTest()
                case .hashable:
                    HashableTest()
                case .searchSort:
                    SearchSortTest()
                case .coreDataTest:
                    CoreDataTestView()
                case .threadTest:
                    BackgroundThreadTestView()
                case .networkTest:
                    NetworkTestView()
                }
                
            })
            
        }
        .preferredColorScheme(.dark)
        .environmentObject(screenNavigator)
        
    }
    
    
    
    
}

enum GridTestPath {
    case magnification
    case rotation
    case drag
    case scrollViewReader
    case geometryReader
    case mask
    case playSound
    case hashable
    case searchSort
    case coreDataTest
    case threadTest
    case networkTest
}




#Preview {
    GridViewTest()
}
