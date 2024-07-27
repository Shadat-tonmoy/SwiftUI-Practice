//
//  CodableBundleExtension.swift
//  SwiftUI_Africa
//
//  Created by Shadat Mufakhkhar Tonmoy on 24/7/24.
//

import Foundation

extension Bundle {
    
    func decode<T : Decodable> (_ file : String) -> T {
        
        // 1. locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not locate the file at : \(file)")
        }
        
        // 2. create a property for the json data
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not read data from \(url)")
        }
        
        // 3. create a decoder
        
        let decoder = JSONDecoder()
        
        // 4. crate a property for the model data
        guard let decodedModels = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode data from file")
        }
        
        // 5. return the model data
        return decodedModels
        
    }
    
    
}
