//
//  BackgroundThreadTestView.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 30/8/24.
//

import SwiftUI

struct BackgroundThreadTestView: View {
    
    @StateObject var viewModel : BackgroundThreadTestViewModel = BackgroundThreadTestViewModel()
    
    var body: some View {
        VStack {
            Text("Fetch Data")
                .padding()
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(.purple))
                .onTapGesture {
                    viewModel.downloadData()
                }
            
            List(viewModel.text, id: \.self) { text in
                Text(text)
            }
        }
        
    }
}

#Preview {
    BackgroundThreadTestView()
}
