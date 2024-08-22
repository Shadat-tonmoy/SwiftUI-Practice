//
//  Extensions.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 15/8/24.
//

import Foundation
import UIKit
import SwiftUI


extension UIColor {
    static func random() -> Color {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let uiColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        return Color(uiColor: uiColor)
        
    }
}

extension Color {
    static func getRandomGradientBackground() -> Gradient{
        let random = UIColor.random()
        let random2 = UIColor.random()
        
        let gradient = Gradient(colors: [random,random2])
        return gradient
    }
}
