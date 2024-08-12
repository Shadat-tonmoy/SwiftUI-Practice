//
//  SwipeActionViewTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 31/7/24.
//

import SwiftUI

struct SwipeActionViewTest: View {
    
    @State var fruits : [String] = ["Apple","Banana","Mango","Guava"]
    
    var body: some View {
        NavigationView {
            List(fruits, id: \.self, rowContent: { item in
                Text(item)
                    .padding()
                    .swipeActions(edge: .trailing){
                        Button("Delete", action: {
                            
                        }).tint(.red)
                        
                        Button("Seen", action: {
                            
                        }).tint(.green)
                        
                        Button("Archive", action: {
                            
                        }).tint(.blue)
                    }
                
            })
        }
    }
}

#Preview {
    SwipeActionViewTest()
}
