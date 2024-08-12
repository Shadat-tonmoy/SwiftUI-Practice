//
//  NavigationStackConvert.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/8/24.
//

import SwiftUI

struct NavigationStackConvert: View {
    var body: some View {
        ZStack {
            
            Color(.systemTeal)
            .ignoresSafeArea()
            
            Text("This Is The Conver Screen")
                .foregroundStyle(Color(.systemTeal))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
        }
    }
}

#Preview {
    NavigationStackConvert()
}
