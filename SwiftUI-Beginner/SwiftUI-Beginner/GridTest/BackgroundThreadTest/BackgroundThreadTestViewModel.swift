//
//  BackgroundThreadTestViewModel.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 30/8/24.
//

import Foundation


class BackgroundThreadTestViewModel : ObservableObject {
    
    
    @Published var text : [String] = []
    
    
    func downloadData() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let data = self?.fetchData()
            DispatchQueue.main.async {
                self?.text = data ?? []
            }
        }
        
        fetchData { result in
            print(result)
        }
    }
    
    
    func downloadDataAsync(){
        fetchDataAsync { [weak self] result in
            print("Result : \(result)")
            self?.text = result.data
        }
    }
    
    
    private func fetchData() -> [String] {
        var text : [String] = []
        for i in 0...100 {
            text.append("Text : \(i+1)")
        }
        return text
    }
    
    private func fetchData(_ completionHandler : ([String]) -> Void) {
        var text : [String] = []
        for i in 0...100 {
            text.append("Text : \(i+1)")
        }
        completionHandler(text) // using closure
    }
    
    private func fetchDataAsync(_ completionHandler : @escaping DownladData) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1.0, execute: {
            var text : [String] = []
            for i in 0...100 {
                text.append("Text : \(i+1)")
            }
            let downloadResult = DownloadResult(data: text)
            completionHandler(downloadResult)
        })
        
    }
    
}


struct DownloadResult {
    let data : [String]
}

typealias DownladData = (DownloadResult) -> Void
