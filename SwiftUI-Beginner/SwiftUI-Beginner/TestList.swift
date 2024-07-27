//
//  TestList.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 15/7/24.
//

import SwiftUI

struct TestList: View {
    
    @State var fruitList = [
        "Apple", "Banana", "Guava", "Orange","Pear"
    ]
    
    @State var vegetables = [
        "Brinjal", "Tomato", "Potato","Bit Root", "Cucumber", "Avocado"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                List{
                    Section(content: {
                        ForEach(fruitList, id: \.self) { fruit in
                            Text(fruit)
                        }
                        .onDelete(perform: { indexSet in
                            deleteItem(indexSet: indexSet)
                        })
                        .onMove(perform: { indices, newOffset in
                            moveItem(from: indices, to: newOffset)
                            
                        })
                    }, header : {
                        SectionHeader(title: "Fruits")
                    })
                    
                    Section(content: {
                        ForEach(vegetables, id: \.self) { vegetable in
                            Text(vegetable)
                        }
                    },
                        header : {
                            SectionHeader(title: "Vegetables")
                        }
                    )
                    
                    Section {
                        ForEach(vegetables, id: \.self) { vegetable in
                            Text(vegetable)
                        }
                    } header: {
                        SectionHeader(title: "Styled Vegetables")
                    }

                    
                }
                .listStyle(.inset)
                
            }
            .navigationTitle("Fruit List")
            .toolbar{
                ToolbarItem(placement: .topBarLeading, content: {EditButton().foregroundStyle(.purple)})
                
                ToolbarItem(placement: .topBarTrailing, content: {AddButton})
            }
        }
        
    }
    
    var AddButton : some View {
        Button(action: addItem, label: {
            Text("Add Item").foregroundStyle(.purple)
        })
        
    }
    
    func deleteItem(indexSet : IndexSet){
        fruitList.remove(atOffsets: indexSet)
    }
    
    func moveItem(from : IndexSet, to : Int) {
        fruitList.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(){
        fruitList.append("Coconuts")
    }
}

#Preview {
    TestList()
}

struct SectionHeader : View {
    let title : String
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
            .padding(.leading,10)
            .font(.headline)
            .textCase(.none)
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.purple)
            )
            
    }
}
