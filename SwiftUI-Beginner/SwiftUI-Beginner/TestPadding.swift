//
//  TestPadding.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 9/7/24.
//

import SwiftUI

struct TestPadding: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
                .foregroundStyle(Color.white)
                .padding(.all,10)
                .padding(.horizontal,30)
                .background(.red)
            
            Spacer()
                .frame(height: 50)
            
            
            VStack(alignment : .leading){
                Text("Hello World")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("There is an option ^I (Control-I) to re-indent the code, which will re-align the code according to the tab width set in your preferences, but that's about as far as it goes.")
                    .font(.subheadline)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
            
            ).padding(.horizontal)
            
            
        }
        
            
    }
}

#Preview {
    TestPadding()
}
