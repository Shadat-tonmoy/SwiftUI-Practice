//
//  TodoItem.swift
//  SwiftUI_ToDo_MVVM
//
//  Created by Shadat Mufakhkhar Tonmoy on 25/7/24.
//

import Foundation

struct TodoItem : Identifiable, Codable {
    var id : String = UUID().uuidString
    var title : String
    var isCompleted : Bool = false
    
    init(id : String = UUID().uuidString, title: String, isCompleted : Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleIsCompleted() -> TodoItem {
        return TodoItem(id: id, title: title, isCompleted: !isCompleted)
    }
}
