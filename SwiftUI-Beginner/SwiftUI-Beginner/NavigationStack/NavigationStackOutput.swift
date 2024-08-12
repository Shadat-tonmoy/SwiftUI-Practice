//
//  NavigationStackOutput.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/8/24.
//

import SwiftUI

struct NavigationStackOutput: View {
    var body: some View {
        ZStack {
            
            Color(.systemOrange)
            .ignoresSafeArea()
            
            Text("This Is The Output Screen")
                .foregroundStyle(Color(.systemOrange))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
        }
    }
}

#Preview {
    NavigationStackOutput()
}
