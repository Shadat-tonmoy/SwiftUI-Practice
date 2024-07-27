//
//  FruitListScreen.swift
//  SwiftUI_FruitsApp
//
//  Created by Shadat Mufakhkhar Tonmoy on 23/7/24.
//

import SwiftUI

struct FruitListScreen: View {
    
    @State var fruitList : [Fruit] = fruits
    @State var showSettingSheet : Bool = false
    
    var body: some View {
        NavigationView {
            List(fruitList, id: \.id, rowContent: { item in
                NavigationLink {
                    FruitDetailsView(fruit: item)
                } label: {
                    FruitRowView(fruit: item)
                        .padding(.vertical,4)
                }

                
            })
            .listStyle(.plain)
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "shuffle")
                        .onTapGesture {
                            fruitList.shuffle()
                        }
                })
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "gearshape.fill")
                        .onTapGesture {
                            showSettingSheet.toggle()
                        }
                })
            }
        }
        .sheet(isPresented: $showSettingSheet, content: {
            SettingsView(isPresented: $showSettingSheet)
        })
    }
}

#Preview {
    FruitListScreen()
}
