//
//  HashableTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/8/24.
//

import SwiftUI

struct MyCustomModel : Identifiable {
    let id : String = UUID().uuidString
    let title : String
}

struct HashableTest: View {
    
    let values : [String] = ["ONE","TWO","THREE","FOUR","FIVE"]
    let models : [MyCustomModel] = [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Three"),
        MyCustomModel(title: "Four")
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(values, id: \.self, content: { value in
                    Text("Value is \(value.hashValue.description)")
                    
                })
                
                ForEach(models, content: { model in
                    Text("Model is \(model)")
                    
                })
            }
        }
    }
}

#Preview {
    HashableTest()
}
