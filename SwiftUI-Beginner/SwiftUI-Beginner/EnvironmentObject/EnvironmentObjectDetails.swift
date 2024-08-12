//
//  EnvironmentObjectDetails.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 29/7/24.
//

import SwiftUI

struct EnvironmentObjectDetails: View {
    
    var device : String
    
//    @ObservedObject var viewModel : EnvironmentObjectViewModel
    
    var body: some View {
        Text("Details of \(device)")
            .font(.largeTitle)
        NavigationLink {
//            EnvironmentObjectThirdView(viewModel: viewModel)
            EnvironmentObjectThirdView()
        } label: {
            Text("Go to next")
                .padding()
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.black)
                )
        }

    }
}

#Preview {
    EnvironmentObjectDetails(device: "iPhone")
}
