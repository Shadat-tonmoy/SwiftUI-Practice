//
//  SafeAreaTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 10/7/24.
//

import SwiftUI

struct SafeAreaTest: View {
    var body: some View {
        ZStack {
            Color(.red)
                .ignoresSafeArea(.all)
            
            ScrollView{
                VStack{
                    ForEach(0..<10){ index in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 150)
                            .padding()
                            .foregroundStyle(Color(.white))
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                }
    //            .background(
    //                Color(.blue)
    //            )
            }
//            .background(
    //            Color(.red)
//                .ignoresSafeArea(.all)
//        )
        }
    }
}

#Preview {
    SafeAreaTest()
}
