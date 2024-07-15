//
//  TestText.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 6/7/24.
//

import SwiftUI

struct TestText: View {
    var body: some View {
        Text("Hello, World! This is a multiline text that may take a couple of line to render and the alignment can also be set")
//            .font(.title2)
            .bold()
//            .underline()
            .italic()
            .underline(true,color: Color.red)
            .font(.system(size: 28))
            .multilineTextAlignment(.leading)
//            .baselineOffset(10)
//            .kerning(2)
            .foregroundColor(.red)
            .frame(width: 150, height: 250, alignment: .leading)
        
            
            
        
    }
}

#Preview {
    TestText()
}
