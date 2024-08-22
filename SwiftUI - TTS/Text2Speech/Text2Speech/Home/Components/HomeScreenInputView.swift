//
//  HomeScreenInputView.swift
//  Text2Speech
//
//  Created by Shadat Mufakhkhar Tonmoy on 19/8/24.
//

import SwiftUI

struct HomeScreenInputView: View {
    
    @State var inputText : String = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "flag.square.fill")
                    .font(.system(size: 40))
                    .foregroundStyle(.indigo)
                
                
                VStack(alignment : .leading) {
                    Text("English")
                    Text("United States")
                        .font(.caption)
                }
                
                Spacer()
                
                Image(systemName: "square.and.arrow.down")
                    .resizable()
                    .foregroundStyle(.indigo)
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal,5)
                
                    .onTapGesture {
                        
                    }
                
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .foregroundStyle(.indigo)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal,5)
                    .padding(.top,5)
            } // : END OF LANGUAGE SECTION
            .padding(.top)
            .padding(.horizontal,10)
            
            Divider()
            
            TextField("Input Text Here", text: $inputText, axis: .vertical)
                .padding(8)
                .lineLimit(5, reservesSpace: true)
                .background(.secondary.opacity(0.1))
            //                                .padding(.horizontal,10)
            
            
        } // END OF INPUT HEADER
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.windowBackground)
        )
        .shadow(radius: 2)
        .padding(.top)
    }
}

#Preview {
    HomeScreenInputView()
}
