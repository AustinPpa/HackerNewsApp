//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Austin Xu on 2023/9/11.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [NewsModel]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,reponse,error) in
                if error == nil{
                    if let safeData = data{
                        let decoder = JSONDecoder()
                        do{
                            let results = try decoder.decode(NewsViewModel.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch{
                            print(error)
                        }
                            
                        
                    }
                }
            }
            task.resume()
        }
        
    }
}
