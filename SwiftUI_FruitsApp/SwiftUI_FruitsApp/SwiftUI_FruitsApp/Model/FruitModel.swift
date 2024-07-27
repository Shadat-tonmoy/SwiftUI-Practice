//
//  FruitModel.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct Fruit : Identifiable {
    var id : UUID = UUID()
    var title : String
    var headline : String
    var image : String
    var gradientColors : [Color]
    var description : String
    var nutrition : [String]
}
