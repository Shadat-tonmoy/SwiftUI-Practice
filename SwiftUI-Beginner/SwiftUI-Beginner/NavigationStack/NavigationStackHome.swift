//
//  NavigationStackHome.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/8/24.
//

import SwiftUI

struct NavigationStackHome: View {
    var body: some View {
        ZStack {
            
            Color(.purple)
            .ignoresSafeArea()
            
            Text("This Is The Home Screen")
                .foregroundStyle(.purple)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
        }
    }
}

#Preview {
    NavigationStackHome()
}
