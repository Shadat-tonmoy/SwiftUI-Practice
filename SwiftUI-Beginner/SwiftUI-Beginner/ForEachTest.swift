//
//  ForEachTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 10/7/24.
//

import SwiftUI

struct ForEachTest: View {
    
    let dummyArray = [
      "Lorem",
      "ipsum",
      "dolor",
      "sit",
      "amet",
      "consectetur",
      "adipiscing",
      "elit"
    ]
    
    var body: some View {
        VStack(alignment : .leading){
            ForEach(0..<3) { index in
                HStack{
                    Circle()
                        .fill(.purple)
                        .frame(width: 40)
                        .overlay{
                            Text("\(index + 1)")
                                .foregroundStyle(Color(.white))
                        }
                    Text("Hello : \(index)")
                }
            }
            
            ForEach(dummyArray.indices){ index in
                Text(dummyArray[index])
                    .foregroundStyle(Color(.white))
                    .padding(.all, 10)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.purple)
                    )
                
            }
        }
        
    }
}

#Preview {
    ForEachTest()
}
