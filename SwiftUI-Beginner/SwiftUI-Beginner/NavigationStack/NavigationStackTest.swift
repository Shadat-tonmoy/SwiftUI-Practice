//
//  NavigationStackTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 5/8/24.
//

import SwiftUI

struct NavigationStackTest: View {
    
    let paths : [NavPath] = [NavPath.HOME,NavPath.CONVERT,NavPath.OUTPUT]
    let pathTitle : [String] = ["Home","Convert","Output"]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing : 30) {
                    
                    HStack {
                        
                        ForEach(paths, id : \.self) { path in
                            NavigationLink(value: path, label: {
                                Text(String(describing: path).capitalized)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal,20)
                                    .padding(.vertical,10)
                                    .background(RoundedRectangle(cornerRadius: 10))
                                    .padding()
                            })
                            
                        }
                        
                    }
                    
                    HStack(spacing : 20) {
                        ForEach(0..<4, content: { index in
                            NavigationLink(value: index, label: {
                                Text("Menu : \(index)")
                                    .font(.callout)
                            })
                            
                        })
                    }
                }
            }
            .navigationTitle("Navigation View")
            .navigationDestination(for: Int.self, destination: { value in
                Text("Hello From Screen : \(value)")
            })
            .navigationDestination(for: NavPath.self, destination: { value in
                switch value {
                    case .HOME:
                        NavigationStackHome()
                    case .CONVERT:
                        NavigationStackConvert()
                    case .OUTPUT:
                        NavigationStackOutput()
                }
                
                
            })
        }
       
    }
}

enum NavPath {
    case HOME
    case OUTPUT
    case CONVERT
}

#Preview {
    NavigationStackTest()
}
