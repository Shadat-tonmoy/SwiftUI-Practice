//
//  CoreDataTestViewModel.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 28/8/24.
//

import Foundation
import CoreData


class CoreDataTestViewModel : ObservableObject {
    
    private let persistanceContainer : NSPersistentContainer
    @Published var taskList : [FruitEntity] = []
    
    init(){
        persistanceContainer = NSPersistentContainer(name: "FruitsDataModel")
        persistanceContainer.loadPersistentStores { (description, error) in
            if let loadError = error {
                print("Error loading core data : \(loadError)")
            } else {
                print("Coredata loaded successfully!")
                
            }
        }
    }
    
    
    func fetchTaskList() {
        let fetchRequest = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            let entityList = try persistanceContainer.viewContext.fetch(fetchRequest)
            self.taskList = entityList
            print("EntityList : \(entityList)")
        } catch let error {
            print("Error fetching data : \(error)")
        }
    }
    
    func addFruit(title : String) {
        let fruitEntity = FruitEntity(context: persistanceContainer.viewContext)
        fruitEntity.id = UUID()
        fruitEntity.title = title
//        fruitEntity.isFavorite = false
        saveData()
    }
    
    func deleteFruit(fruit : FruitEntity) {
        persistanceContainer.viewContext.delete(fruit)
        saveData()
    }
    
    func deleteFruit(indexSet : IndexSet) {
        guard let index = indexSet.first else { return }
        let fruitAtIndex = taskList[index]
        persistanceContainer.viewContext.delete(fruitAtIndex)
        saveData()
    }
    
    
    func updateTaskName(fruit : FruitEntity, newName : String) {
        fruit.title = newName
        saveData()
    }
    
    func updateFruitLikedState(fruit : FruitEntity, value : Bool) {
        fruit.isFavorite = value
        saveData()
    }
    
    
    func saveData(){
        do {
            try persistanceContainer.viewContext.save()
            fetchTaskList()
        } catch let error  {
            print("Error saving data : \(error)")
        }
        
    }
    
    
    
    
    
}
