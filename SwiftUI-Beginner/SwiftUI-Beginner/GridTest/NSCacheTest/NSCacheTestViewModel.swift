//
//  NSCacheTestViewModel.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 5/9/24.
//

import Foundation
import SwiftUI


class NSCacheTestViewModel : ObservableObject {
    
    let cacheManager = NSCacheManager.shared
    let imageName = "test_image"
    
    @Published var image : UIImage? = nil
    @Published var cachedImage : UIImage? = nil
    @Published var infoMessage : String = ""
    
    init(){
        image = UIImage(named: imageName)
    }
    
    func saveToCache() {
        if let assetImage = image {
            infoMessage = cacheManager.cacheImage(key: imageName, image: assetImage)
        } else {
            infoMessage = "Invalid asset image to cache"
        }
    }
    
    func getImageFromCache() {
        if let imageFromCache = cacheManager.getImageFromCache(key: imageName) {
            cachedImage = imageFromCache
            infoMessage = "Image is retrieved from cache!"
        } else {
            infoMessage = "Could not retrieve image from cache!"
            cachedImage = nil
        }
    }
    
    func removeImageFromCache() {
        infoMessage = cacheManager.removeImageFromCache(key: imageName)
    }
    
}
