//
//  NetworkTestViewModel.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 31/8/24.
//

import Foundation


class NetworkTestViewModel : ObservableObject {
    
    @Published var posts : [PostModel] = []
    
    @Published var postDetails : PostModel? = nil
    
    static let shared : NetworkTestViewModel = NetworkTestViewModel()
    
    private init() {
        
    }
    
    
    func fetchData() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        downloadData(urlString: urlString) { [weak self] data in
            let decodedPosts : [PostModel]? = self?.decodeData(data)
            if let postData = decodedPosts {
                DispatchQueue.main.async {
                    self?.posts.append(contentsOf: postData)
                }
            }
        }
    }
    
    
    func fetchPostDetails(postId : Int) {
        let urlString = "https://jsonplaceholder.typicode.com/posts/\(postId)"
        downloadData(urlString: urlString) { [weak self] data in
            let decodedPost : PostModel? = self?.decodeData(data)
            DispatchQueue.main.async {
                self?.postDetails = decodedPost
            }
        }
    }
    
    func decodeData<T : Codable>(_ data : Data) -> T? {
        let decodedData = try? JSONDecoder().decode(T.self, from: data)
        return decodedData
        
    }
    
    
    
    func downloadData(urlString : String, _ completionHandler : @escaping (Data) -> Void){
        guard let url = URL(string: urlString) else { print("Invalid urlstring "); return }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, urlResoponse, error) in
            
            
            guard let data = data else {
                print("No Data Found!")
                return
            }
            
            if(error != nil) {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let httpUrlResponse = (urlResoponse as? HTTPURLResponse) else {
                print("Invalid http url response")
                return
            }
            
            if(httpUrlResponse.statusCode >= 200 && httpUrlResponse.statusCode <= 300) {
                
            } else {
                print("Unsuccessful http url response code : \(httpUrlResponse.statusCode)")
                return
            }
            
            completionHandler(data)
        }).resume()
        
        
    }
    
    
}


struct PostModel : Identifiable, Codable {
    let id : Int
    let userId : Int
    let title : String
    let body : String
}
