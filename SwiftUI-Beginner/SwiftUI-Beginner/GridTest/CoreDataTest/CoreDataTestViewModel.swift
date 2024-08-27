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
    
    
    
}
