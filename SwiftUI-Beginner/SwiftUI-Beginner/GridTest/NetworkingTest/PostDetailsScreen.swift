//
//  PostDetailsScreen.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 1/9/24.
//

import SwiftUI

struct PostDetailsScreen: View {
    
    let postId : Int
    @StateObject private var viewModel = NetworkTestViewModel.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                if let postDetails = viewModel.postDetails {
                    Text(postDetails.body)
                }
            }
            .onAppear {
                viewModel.fetchPostDetails(postId: postId)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
        
    }
}

#Preview {
    PostDetailsScreen(postId: 1)
}
