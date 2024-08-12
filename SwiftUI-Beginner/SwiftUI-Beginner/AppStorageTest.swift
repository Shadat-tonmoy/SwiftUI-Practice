//
//  AppStorageTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 30/7/24.
//

import SwiftUI

struct AppStorageTest: View {
    
    @State var name : String? = "Shadat"
    
    var body: some View {
        Text(name ?? "Enter name here")
        
        if let userName = name {
            Text("User name is : \(userName)")
        }
        
        Button(action: {
            name = "Shadat Tonmoy"
        }, label: {
            Text("Update Name")
        })
    }
}

#Preview {
    AppStorageTest()
}
