//
//  ToolbarTest.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/8/24.
//

import SwiftUI

struct ToolbarTest: View {
    
    @State var inputText : String = ""
    @State var proVersionSheet : Bool = false
    @State var moreOptionSheet : Bool = false
    @State var showSavePopOver : Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
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
                                    .popover(isPresented: $showSavePopOver, arrowEdge: .top, content: {
                                        VStack(alignment : .leading) {
                                            Group {
                                                Text("Save As MP3")
                                                Text("Save As AAC")
                                                Text("Save As WAV")
                                            }
                                            .padding(.vertical, 5)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        }
                                        .presentationCompactAdaptation(.popover)
                                        .padding()
                                    })
                                    .onTapGesture {
                                        showSavePopOver.toggle()
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
                        
                    } // END OF WHOLE CONTAINER
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Text To Speech")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading, content: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .onTapGesture {
                            moreOptionSheet.toggle()
                        }
                })
                
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "crown.fill")
                        .foregroundStyle(.white)
                        .font(.system(size: 10))
                        .padding(.all,6)
                        .background(
                            Circle()
                                .fill(.indigo)
                        )
                        .onTapGesture {
                            proVersionSheet.toggle()
                        }
                    
                })
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Menu {
                        Button(action: {
                            
                        }, label: {
                            Text("Menu 1")
                                .foregroundStyle(.indigo)
                        })
                        
                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.indigo)
                    }
                    
                })
            })
            
            .safeAreaInset(edge: .bottom, alignment : .trailing, content: {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.all,5)
                    .background(
                        Circle()
                            .foregroundStyle(.indigo)
                    )
                    .padding()
            })
            .sheet(isPresented: $proVersionSheet, content: {
                PremiumVersionScreen()
                    .presentationDetents([.medium, .large])
            })
            .sheet(isPresented: $moreOptionSheet, content: {
                MoreOptionScreen()
            })
            
            
        }
        
    }
}

#Preview {
    ToolbarTest()
}
