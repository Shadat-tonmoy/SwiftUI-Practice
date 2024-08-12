//
//  EnvironmentObjectView.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 29/7/24.
//

import SwiftUI

struct EnvironmentObjectView: View {
    
    @StateObject private var viewModel : EnvironmentObjectViewModel = EnvironmentObjectViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.devices, id: \.self, rowContent: { item in
                    NavigationLink {
//                        EnvironmentObjectDetails(device: item, viewModel: viewModel)
                        EnvironmentObjectDetails(device: item)
                    } label: {
                        Text(item)
                            .font(.headline)
                    }

                    
                    
                })
            }
            .navigationTitle("Device List")
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    EnvironmentObjectView()
}
