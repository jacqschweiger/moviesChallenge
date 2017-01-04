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
        //TODO change movie title to have no spaces or punctation, or use other input to search
        
        let urlString = "https://www.omdbapi.com/?t=\(movieTitle)&y=&plot=short&r=json"
        
        let url = URL(string: urlString)

        if let unwrappedURL = url {
            
            let session = URLSession.shared

            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in

                if let unwrappedData = data {

                    do {

                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: String]
                        print(responseJSON)
                        completion(responseJSON)

                    } catch {

                        print(error)
                    }

                }

            }
            
            task.resume()
        }
    }

    
    
}
