//
//  TestExtraction.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 12/7/24.
//

import SwiftUI

struct TestExtraction: View {
    
    @State var backgroundColor = Color.red
    @State var message = "Hello"
    
    
    var body: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            
            ExtractedView(backgroundColor: $backgroundColor, message: $message)
        }
    }
    
    
    
    
}

#Preview {
    TestExtraction()
}

struct ExtractedView: View {
    
    @Binding var backgroundColor : Color
    @Binding var message : String
    
    let dummyColors = [Color.red,Color.green,Color.blue,Color.purple,Color.teal,Color.orange, Color.cyan, Color.indigo]
    
    let dummyText = [
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
        VStack(spacing : 20){
            
            HeaderMessage
            
            ClickButton
            
            
        }
    }
    
    var ClickButton : some View{
        Button(action: {
            handleButtonClicked()
        }, label: {
            Text("Click Here")
                .padding(.horizontal,30)
                .padding(.vertical,15)
                .foregroundStyle(backgroundColor)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                )
        })
    }
    
    var HeaderMessage : some View{
        Text(message)
            .font(.largeTitle)
            .foregroundStyle(Color.white)
    }
    
    func handleButtonClicked(){
        let randomColor = dummyColors.randomElement() ?? Color.red
        backgroundColor = randomColor
        
        let randomText = dummyText.randomElement() ?? "Hello"
        message = randomText
        
    }
}
