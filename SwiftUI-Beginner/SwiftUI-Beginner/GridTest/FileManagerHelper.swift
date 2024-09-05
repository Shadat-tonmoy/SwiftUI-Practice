//
//  FileManagerHelper.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 1/9/24.
//

import Foundation
import SwiftUI

class FileManagerHelper {
    
    static let shared : FileManagerHelper = FileManagerHelper()
    let imageFolderTitle : String = "SWIFT-UI-Beginner"
    let imageFileName : String = "IMG_\(UUID().uuidString).jpg"
    
    private init(){
        
    }
    
    func getAllImageFromFolder() -> [String]? {
        let fileManager = FileManager.default
        var imageFiles : [String] = []
        guard
            let rootFolder = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        else {
            print("Error fetching images inside folder!")
            return imageFiles
        }
        
        let imageFolder = rootFolder.appendingPathComponent(imageFolderTitle)
        let imageFolderPath = imageFolder.path()
        if let allFiles = try? fileManager.contentsOfDirectory(atPath: imageFolderPath) {
            
            print("All files inside folder : \(imageFolderPath), \(allFiles)")
            for file in allFiles {
                let absouleFilePath = imageFolder.appendingPathComponent(file).path()
                imageFiles.append(absouleFilePath)
                print("Image file path : \(absouleFilePath)")
//                if let image = UIImage(contentsOfFile: absouleFilePath) {
//                    imageFiles.append(image)
//                }
            }
        }
        
        
        return imageFiles
    }
    
    func deleteImageFile(filePath : String) {
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: filePath)
        } catch let error {
            print("Error in deleting file : \(error.localizedDescription)")
        }
    }
    
    
    func getImageFromPath() -> UIImage? {
        guard
            let imagePath = getFilePath(imageFileName)?.path()
        else {
            print("Invalid image file path")
            return nil
        }
        
        print("Image path : \(imagePath)")
        
        return UIImage(contentsOfFile: imagePath)
        
    }
    
    func saveImage(_ image : UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            print("Invalid image data")
            return
            
        }
        
        //        let documentDirectory = FileManager
        //            .default
        //            .urls(for: .documentDirectory, in: .userDomainMask)
        //            .first
        
        //        if let imageDirectory = documentDirectory?.appending(path: "SWIFT-UI-Beginner") {
        //            try? FileManager.default.createDirectory(at: imageDirectory, withIntermediateDirectories: true)
        //
        //        } else {
        //            print("Could not create sub directory")
        //        }
        
        //        guard
        //            let imageDirectory = documentDirectory?.appending(path: imageFolderTitle)
        //        else {
        //            print("Invalid image path")
        //            return
        //        }
        //        try? FileManager.default.createDirectory(at: imageDirectory, withIntermediateDirectories: true)
        
        guard let imagePath = getFilePath(imageFileName) else {
            print("Invalid image path")
            return
        }
        // imageDirectory.appendingPathComponent("image_\(UUID().uuidString).jpeg", conformingTo: .jpeg)
        do {
            try imageData.write(to: imagePath)
            print("Image is successfully saved at : \(imagePath)")
        } catch let error {
            print("Error saving image...: \(error)")
        }
        
        
        
        //        print("Image directory is : \(imageDirectory)")
        //        print("Image path is : \(imagePath)")
        
        
    }
    
    
    func getFilePath(_ fileName : String) -> URL? {
        let fileManager : FileManager = FileManager.default
        let rootFolder = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        guard
            let imageFolder = rootFolder?.appending(path: imageFolderTitle) else {
            print("Invalid folder for image folder")
            return nil
        }
        
        if !fileManager.fileExists(atPath: imageFolder.path()) {
            try? fileManager.createDirectory(at: imageFolder, withIntermediateDirectories: true)
        }
        
        let imagePath = imageFolder.appendingPathComponent(fileName, conformingTo: .image)
        
        return imagePath
    }
}
