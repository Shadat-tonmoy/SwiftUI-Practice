//
//  TestColor.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 7/7/24.
//

import SwiftUI

struct TestColor: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(UIColor.secondarySystemBackground))
                .frame(width: 250, height: 150)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            
            RoundedRectangle(cornerRadius: 24)
                .fill(Color("CustomColor"))
                .frame(width: 250, height: 150)
                .shadow(radius: 16)
                .padding(10.0)

        }
        
            
    }
}

#Preview {
    TestColor()
}
