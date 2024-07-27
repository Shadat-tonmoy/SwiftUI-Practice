//
//  GridTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 10/7/24.
//

import SwiftUI

struct GridTest: View {
    
    let columns : [GridItem] = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6)

    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns,
                      pinnedViews: [.sectionHeaders],
                      content: {
                Section(content: {
                    ForEach(0..<10) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 200)
                        
                    }
                }, header: {
                    Text("Section 1")
                        .font(.headline)
                        .foregroundStyle(Color(.white))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.blue)
                        .padding(.vertical)
                        
                })
                
                Section(content: {
                    ForEach(0..<10) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.purple)
                            .frame(height: 200)
                    }
                }, header: {
                    Text("Section 2")
                        .font(.headline)
                        .foregroundStyle(Color(.white))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.orange)
                        .padding(.vertical)
                    
                    
                    
                })
                
            })
        }
        
    }
}

#Preview {
    GridTest()
}
