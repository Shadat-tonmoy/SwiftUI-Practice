//
//  ScrollViewReaderTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 15/8/24.
//

import SwiftUI

struct ScrollViewReaderTest: View {
    
    @State var indexText = ""
    @State var indexToScroll = 0
    
    var body: some View {
        VStack {
            
            TextField("Enter number here", text: $indexText)
                .padding()
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button(action: {
                indexToScroll = Int(indexText) ?? 0
                
            }, label: {
                Text("Go To Index \(indexText)")
            })
                
            
            ScrollView {
                ScrollViewReader { reader in
                    ForEach(0..<50) { index in
                        Text("This is item : \(index)")
                            .padding()
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(height: 200)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.getRandomGradientBackground())
                            )
                            .padding(.horizontal)
                            .id(index)
                    }
                    .onChange(of: indexToScroll) { value in
                        reader.scrollTo(value)
                        
                    }
                }
            }
        }
        .navigationTitle("Scroll View Reader")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    
}

#Preview {
    ScrollViewReaderTest()
}
