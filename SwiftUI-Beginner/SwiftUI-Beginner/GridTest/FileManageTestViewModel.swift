//
//  FileManageTestViewModel.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 1/9/24.
//

import Foundation
import SwiftUI

class FileManagerTestViewModel : ObservableObject {
    
//    static let shared : FileManagerTestViewModel = FileManagerTestViewModel()
    let imageName = "background"
    
    @Published var image : UIImage? = nil
    let fileManagerHelper = FileManagerHelper.shared
    @Published var allImages : [String] = []
    
    init(){
        print("FileManagerTestViewModel INITIALIZING")
    }
    
    func fetchImage(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
//            self.image = UIImage(named: self.imageName)
            if let allImages = self.fileManagerHelper.getAllImageFromFolder() {
                self.allImages = allImages
            }
            
            if let imageFromFile = self.fileManagerHelper.getImageFromPath() {
                self.image = imageFromFile
            } else {
                print("Invalid image from path!")
            }
        })
        
    }
    
    func saveImage() {
        if let imageToSave = image {
            fileManagerHelper.saveImage(imageToSave)
        }
    }
    
    func deleteImage(_ imagePath : String) {
        fileManagerHelper.deleteImageFile(filePath: imagePath)
        fetchImage()
    }
    
    deinit {
        print("FileManagerTestViewModel DE-INITIALIZING")
    }
}
