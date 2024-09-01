//
//  NetworkTestView.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 31/8/24.
//

import SwiftUI

struct NetworkTestView: View {
    
    @StateObject private var viewModel = NetworkTestViewModel.shared
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        VStack {
            List {
                ForEach(viewModel.posts) { post in
                    NavigationLink {
                        PostDetailsScreen(postId: post.id)
                    } label: {
                        VStack {
                            Text(post.title)
                                .font(.title).lineLimit(2)
                                .fontWeight(.semibold)
                            Text(post.body.trimmingCharacters(in: .whitespaces))
                                .font(.callout)
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("CardBG"))
                                .shadow(radius: 10)
                            
                                
                        )
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                }
            }
            .listStyle(.plain)
            
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
        .onAppear {
            viewModel.fetchData()
        }
        
    }
}

#Preview {
    NetworkTestView()
}
