//
//  NSCacehManager.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 5/9/24.
//

import Foundation
import SwiftUI

class NSCacheManager {
    
    static let shared : NSCacheManager = NSCacheManager()
    private let imageCache : NSCache<NSString,UIImage> =  {
        let nsCache = NSCache<NSString, UIImage>()
        nsCache.countLimit = 10
        nsCache.totalCostLimit = 1024 * 1024 * 50
        return nsCache
    }()
    
    private init(){
        
    }
    
    func cacheImage(key : String, image : UIImage) -> String {
//        imageCache.setValue(image, forKey: key)
        imageCache.setObject(image, forKey: key as NSString)
        return "Image is cached with key : \(key)"
    }
    
    func getImageFromCache(key : String) -> UIImage? {
        let imageFromCache = imageCache.object(forKey: key as NSString)
        print("Getting image from cache with key : \(key)")
        return imageFromCache
    }
    
    func removeImageFromCache(key : String) -> String {
        imageCache.removeObject(forKey: key as NSString)
        return "Image is deleted from cache with key : \(key)"
    }
    
    
    
    
    
}
