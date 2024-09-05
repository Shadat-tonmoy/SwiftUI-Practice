//
//  FileManagerTestView.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 1/9/24.
//

import SwiftUI

struct FileManagerTestView: View {
    
    @StateObject var viewModel : FileManagerTestViewModel = FileManagerTestViewModel()
    
    var body: some View {
        VStack {
            if let image = viewModel.image {
                VStack {
                    //                    Image(uiImage: image)
                    //                        .resizable()
                    //                        .frame(width: 300, height: 300)
                    //                        .scaledToFill()
                    //
                    //
                    //                    Button {
                    //                        viewModel.saveImage()
                    //                    } label: {
                    //                        Text("Save Image")
                    //                            .padding()
                    //                            .foregroundStyle(.white)
                    //                            .background(
                    //                                RoundedRectangle(cornerRadius: 10)
                    //                                    .fill(.purple)
                    //                            )
                    //                    }
                }
            } else {
                VStack {
                    ProgressView()
                    Text("Fetching image...Please wait a moment")
                }
            }
            
            List {
                ForEach(viewModel.allImages, id: \.self) { imagePath in
                    if let uiImage = UIImage(contentsOfFile: imagePath) {
                        HStack {
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .scaledToFill()
                            
                            Spacer()
                            
                            Image(systemName: "trash.fill")
                                .foregroundStyle(.red)
                                .onTapGesture {
                                    viewModel.deleteImage(imagePath)
                                }
                        }
                    }
                    
                    
                }
            }
        }
        .onAppear {
            viewModel.fetchImage()
        }
        
    }
}

#Preview {
    FileManagerTestView()
}
