//
//  EnvironmentObjectViewModel.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 29/7/24.
//

import Foundation


class EnvironmentObjectViewModel : ObservableObject {
    
    @Published var devices : [String] = []
    
    init() {
        getDevices()
    }
    func getDevices() {
        devices.append(contentsOf: ["iPhone 13", "iPad", "Mac Book Pro"])
    }
    
}
