//
//  TodoListViewModel.swift
//  SwiftUI_ToDo_MVVM
//
//  Created by Shadat Mufakhkhar Tonmoy on 25/7/24.
//

import SwiftUI

class TodoListViewModel : ObservableObject {
    
    
    
    @Published var todoItems : [TodoItem] = [] {
        // computed properties
        didSet {
            saveItems()
        }
        
    }
    let itemListKey = "item_list"
    
    init() {
        getItems()
    }
    
    private func getItems() {
//        let items = [
//            TodoItem(title: "Item 1", isCompleted: true),
//            TodoItem(title: "Item 2", isCompleted: false),
//            TodoItem(title: "Item 3", isCompleted: false),
//            TodoItem(title: "Item 4", isCompleted: true)
//        ]
        
        guard
            let itemListData = UserDefaults().data(forKey: itemListKey),
            let decodedItems = try? JSONDecoder().decode([TodoItem].self, from: itemListData)
        else {
            print("Could not decode data from user defaults")
            return
        }
        
        todoItems = decodedItems
    }
    
    
    func deleteItem(indexSet : IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(indexSet : IndexSet, newOffset : Int) {
        todoItems.move(fromOffsets: indexSet, toOffset: newOffset)
    }
    
    func addTodoItem(title : String){
        todoItems.append(TodoItem(title: title, isCompleted: false))
    }
    
    func updateIsCompleted(todoItem : TodoItem) {
        if let index = todoItems.firstIndex(where: { item in
            item.id == todoItem.id
        }) {
            todoItems[index] = todoItem.toggleIsCompleted()
            
        }
        
    }
    
    private func saveItems(){
        guard let encodedData = try? JSONEncoder().encode(todoItems) else {
            print("Could not encode data")
            return
        }
        UserDefaults().setValue(encodedData, forKey: itemListKey)
    }
    
}
