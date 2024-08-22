//
//  SavedFilesScreen.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 22/8/24.
//

import SwiftUI

struct SavedFilesScreen: View {
    var body: some View {
        VStack(spacing : 10) {
            Image(systemName: "clock.fill")
                .font(.title)
            Text("Recent Files Will Show Here...")
                .font(.title)
                
        }
    }
}

#Preview {
    SavedFilesScreen()
}
