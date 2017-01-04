//
//  MoviesAPIClient.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation

class MoviesAPIClient {
    
    class func getMovies(with completion: @escaping ([[String : String]])-> Void) {
        
        var moviesDict: [[String : String]]!
        
        let urlString = "https://www.omdbapi.com/?s=\(searchInput)&y=&plot=short&r=json"
        
        let url = URL(string: urlString)
        
        if let unwrappedURL = url {
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: AnyObject]
                        
                        moviesDict = responseJSON["Search"] as! [[String : String]]
                        
                        completion(moviesDict)
                    
                    } catch {
                        
                        print(error)
                    }
                }
                
            }
            
            task.resume()
        }
    }
    
    class func getFullMovieInfo(with completion: @escaping ([String : String])-> Void) {
        
        print("1")
        
        let urlString = "https://www.omdbapi.com/?t=\(movieTitle)&y=&plot=short&r=json"
        print("2")
        let newURL = URL(string: urlString)
        print("3")
        if let unwrappedURL = newURL {
            print("4")
            let session = URLSession.shared
            print("5")
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                print("6")
                if let unwrappedData = data {
                    print("7")
                    do {
                        print("8")
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: String]
                        print("9")
                        completion(responseJSON)
                        print("10")
                    } catch {
                        print("11")
                        print(error)
                    }
                    print("12")
                }
                print("13")
            }
            
            task.resume()
        }
    }

    
    
}
