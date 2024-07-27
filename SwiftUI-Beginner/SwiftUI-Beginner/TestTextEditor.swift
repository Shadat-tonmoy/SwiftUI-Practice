//
//  TestTextEditor.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 17/7/24.
//

import SwiftUI

struct TestTextEditor: View {
    
    @State var editorText : String = ""
    @State var toggleState : Bool = false
    
    var body: some View {
        ZStack{
            Color.purple.ignoresSafeArea()
            
            VStack {
                TextEditor(text: $editorText)
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                
                Toggle(isOn: $toggleState, label: {
                    Text("Agree to the ")
                        .padding()
                        .foregroundStyle(.purple)
                        .background(
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(.white)
                        )
                        
                })
                .toggleStyle(SwitchToggleStyle(tint: .cyan))
                .padding()
//                Text(editorText)
            }
        }
    }
}

#Preview {
    TestTextEditor()
}
