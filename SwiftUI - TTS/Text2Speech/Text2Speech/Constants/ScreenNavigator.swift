//
//  Paths.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/8/24.
//

import Foundation


enum NavigationPath {
    case Home
    case LanguageSelection
}

class ScreenNavigator : ObservableObject {
    @Published var list : [NavigationPath] = []
    
    func openLanguageSelectionScreen() {
        list.append(.LanguageSelection)
    }
    
    func closeScreen() {
        list.removeLast()
    }
}


