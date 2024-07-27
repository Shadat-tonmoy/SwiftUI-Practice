//
//  TestSheet.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 12/7/24.
//

import SwiftUI

struct TestSheet: View {
    
    @State var showSheet = false
    
    var body: some View {
        ZStack{
            Color.teal
                .ignoresSafeArea()
            
            VStack{
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Text("Show Sheet")
                        .padding()
                        .foregroundStyle(.teal)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                
                        )
                })
            }
        }
        .sheet(isPresented: $showSheet, content: {
            SheetView()
        })
        
        
    }
}


struct SheetView : View {
    @Environment(\.dismiss) var dismiss
    
     
    var body: some View {
        ZStack(alignment : .topLeading){
            Color.purple
                .ignoresSafeArea()
            
            Image(systemName: "xmark")
                .font(.system(size: 24))
                .foregroundStyle(.white)
                .padding()
                .padding(.top)
                .onTapGesture {
                    dismiss()
                    
                }
            
            VStack{
                Spacer()
                Text("Hello World")
                    .foregroundStyle(.white)
                    .frame(maxWidth : .infinity, alignment: .center)
                Spacer()
            }
        }
    }
}

#Preview {
    TestSheet()
}
