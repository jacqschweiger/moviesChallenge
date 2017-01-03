//
//  Movie.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation

class Movie {
    
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var poster: String
    
    init(dictionary: [String: String]) {
        self.title = dictionary["Title"]!
        self.year = dictionary["Year"]!
        self.imdbID = dictionary["imdbID"]!
        self.type = dictionary["Type"]!
        self.poster = dictionary["Poster"]!
    }    
    
}
