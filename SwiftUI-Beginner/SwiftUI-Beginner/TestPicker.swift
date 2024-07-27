//
//  TestPicker.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 17/7/24.
//

import SwiftUI

struct TestPicker: View {
    
    @State var selectedValue : String = ""
    
    @State var selectedColor : Color = Color.purple
    
    @State var selectedDate : Date = Date()
    
    @State var stepValue : Int = 10
    
    @State var sliderValue : Double = 0.0
    
    @State var sliderColor : Color = .green
    
    var body: some View {
        ZStack {
            selectedColor.ignoresSafeArea()
            ScrollView {
                VStack{
                    Picker(selection: .constant(0), content: {
                        ForEach(1..<20){ index in
                            Text("\(index)").tag("\(index)")
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.teal)
                                )
                        }
                    }, label: {
                        PickerLabelView()
                        
                    })
                    .pickerStyle(.menu)
                    
                    HStack{
                        Text("Selected Value is : \(selectedValue)")
                    }
                    
                    ColorPicker("Pick A Color", selection: $selectedColor, supportsOpacity: true)
                        .foregroundStyle(selectedColor)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                        )
                        .padding()
                    
                    DatePicker("Select A Date", selection: $selectedDate)
                        .foregroundStyle(selectedColor)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                        )
                        .padding()
                    
                    DatePicker("Select A Date", selection: $selectedDate, displayedComponents: [.date])
                        .datePickerStyle(.automatic)
                        .foregroundStyle(selectedColor)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                        )
                        .padding()
                    
                    DatePicker("Select A Time", selection: $selectedDate, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(.automatic)
                        .foregroundStyle(selectedColor)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                        )
                        .padding()
                    
                    Stepper("Select Value : \(stepValue)", value: $stepValue)
                        .foregroundStyle(selectedColor)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                        )
                        .padding()
                    
                    VStack {
                        Text("Slider Value is : \(Int(sliderValue))")
                            .foregroundStyle(sliderColor)
                        Slider(value: $sliderValue,
                               in: 0...100, step: 1,
                               onEditingChanged: { value in
                            if sliderValue > 50 {
                                sliderColor = .red
                            } else if sliderValue > 30 {
                                sliderColor = .orange
                            } else if sliderValue > 20 {
                                sliderColor = .yellow
                            } else {
                                sliderColor = .green
                            
                            }
                            
                        }
                        
                        )
                            .tint(.purple)
                            
                    }
                    .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                        )
                    .padding()
                }
            }
        }
    }
}

#Preview {
    TestPicker()
}

struct PickerLabelView: View {
    var body: some View {
        
        HStack{
            Text("Value Select")
                .background(.purple)
        }
    }
}
