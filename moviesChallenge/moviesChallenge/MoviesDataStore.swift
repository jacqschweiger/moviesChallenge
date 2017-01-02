//
//  MoviesDataStore.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class MoviesDataStore {
    
    static let sharedInstance = MoviesDataStore()
    
    private init() {}
    
    var movies: [Movie]!
    
    func getMoviesFromAPI(completion: @escaping ()->()) {
       
        movies = []
        
        MoviesAPIClient.getMovies { (results) in
            for movie in results {
                let newMovie = Movie(dictionary: movie)
                self.movies.append(newMovie)
            }
        }
        
        completion()
        
    }
    
}

