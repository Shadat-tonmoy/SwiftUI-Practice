//
//  InitializerTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 10/7/24.
//

import SwiftUI

struct InitializerTest: View {
    
    let backgroundColor : Color
    let count : Int
    let title : String
    
    init(count: Int, title: String, type : Fruit) {
        self.count = count
        self.title = title
        if(type == .apple) {
            backgroundColor = Color.red
        } else if(type == .orange) {
            backgroundColor = Color.orange
        } else if(type == .banana) {
            backgroundColor = Color.yellow
        } else {
            backgroundColor = Color.purple
        }
    }
    
    enum Fruit{
        case apple
        case orange
        case banana
    }
    
    
    var body: some View {
        VStack{
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(Color(.white))
            Text(title)
                .font(.headline)
                .foregroundStyle(Color(.white))
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 5)
    }
}

#Preview {
    InitializerTest(count: 6, title: "Orange", type: .banana)
}
