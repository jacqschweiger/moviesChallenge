//
//  MoviesAPIClient.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation

class MoviesAPIClient {
    
    class func getMovies(with completion: @escaping ([String : String])-> Void) {
        
        let urlString = "https://www.omdbapi.com/?t=\(searchInput)&y=&plot=short&r=json"
        
        let url = URL(string: urlString)
        
        if let unwrappedURL = url {
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: String]
                        
                        
                        completion(responseJSON)
                        
                        print(responseJSON)
                        
                    } catch {
                        
                        print(error)
                    }
                }
                
            }
            
            task.resume()
        }
    }
    
}
