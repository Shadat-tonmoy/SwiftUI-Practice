//
//  ScreenNavigator.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 15/8/24.
//

import Foundation
import SwiftUI


class ScreenNavigator : ObservableObject {
    
    @Published var paths : [GridTestPath] = []
    @Published var otherScreen = false
    
    func openMagnificationGestureScreen() {
        paths.append(.magnification)
        print("Opening magnification screen")
        otherScreen = true
    }
    
    func openDragGestureScreen() {
        paths.append(.drag)
        print("Opening drag screen")
        otherScreen = true
    }
    
    func openRotateGestureScreen() {
        paths.append(.rotation)
        print("Opening rotation screen")
        otherScreen = true
    }
    
    func openScrollViewReaderScreen() {
        paths.append(.scrollViewReader)
        print("Opening scroll view reader")
        otherScreen = true
    }
    
    func openGeometryReaderScreen(){
        paths.append(.geometryReader)
        print("Opening geometry reader")
        otherScreen = true
    }
    
    func openMaskScreen(){
        paths.append(.mask)
        print("Opening mask screen")
        otherScreen = true
    
    }
    
    func openPlaySoundScreen() {
        paths.append(.playSound)
        print("Opening play sound screen")
        otherScreen = true
    
    }
    
    func openHashableScreen() {
        paths.append(.hashable)
        print("Opening hashable screen")
        otherScreen = true
    }
    
    func openSearchSortScreen() {
        paths.append(.searchSort)
        print("Opening search sort screen")
        otherScreen = true
    }
    
    func openCoreDataTestScreen() {
        paths.append(.coreDataTest)
        print("Opening core data test screen")
        otherScreen = true
    }
    
    
    
    
}
