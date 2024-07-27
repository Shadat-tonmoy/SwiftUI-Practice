//
//  SettingsView.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isPresented : Bool
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    GroupBox {
                        VStack{
                            HStack{
                                Text("Fructus".uppercased())
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Image(systemName: "info.circle")
                            }
                            
                            Divider()
                            
                            HStack(alignment : .top, spacing : 20) {
                                
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Text("Blueberries are perennial flowering plants with blue or purple berries. They are classified in the section Cyanococcus within the genus Vaccinium. Vaccinium also includes cranberries, bilberries, huckleberries and Madeira blueberries.")
                                    .font(.callout)
                            }
                        }
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "xmark")
                        .onTapGesture {
                            isPresented.toggle()
                        }
                })
            }
        }
    }
}

#Preview {
    SettingsView(isPresented: .constant(false))
}
