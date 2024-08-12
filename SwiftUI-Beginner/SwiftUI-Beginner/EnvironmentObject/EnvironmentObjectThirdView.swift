//
//  EnvironmentObjectThirdView.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 29/7/24.
//

import SwiftUI

struct EnvironmentObjectThirdView: View {
    
//    @State var viewModel : EnvironmentObjectViewModel
    
    @EnvironmentObject var viewModel : EnvironmentObjectViewModel
    
    var body: some View {
        VStack {
            List(viewModel.devices, id: \.self, rowContent: { item in
                Text("Hello \(item) from third screen")
                
            })
            Text("This is the third view")
        }
        
    }
}

#Preview {
    EnvironmentObjectThirdView()
}
