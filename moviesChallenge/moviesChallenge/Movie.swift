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
    var rated: String
    var released: String
    var runtime: String
    var genre: String
    var director: String
    var writer: String
    var actors: String
    var plot: String
    var language: String
    var country: String
    var awards: String
    var poster: String
    var metaScore: String
    var imdbRating: String
    var imdbVotes: String
    var imdbID: String
    var type: String
    var response: String
    
    init(dictionary: [String: String]) {
        
        
//        title: String, year: String, rated: String, released: String, runtime: String, genre: String, director: String, writer: String, actors: String, plot: String, language: String, country: String, awards: String, poster: String, metaScore: String, imdbRating: String, imdbVotes: String, imdbID: String, type: String, response: String)
//        self.fullName = dictionary["full_name"] as! String
//        self.htmlURL = URL(string: (dictionary["html_url"] as! String))!
//        self.repositoryID = String(dictionary["id"] as! Int)
        
        
        self.title = dictionary["Title"]!
        self.year = dictionary["Year"]!
        self.rated = dictionary["Rated"]!
        self.released = dictionary["Released"]!
        self.runtime = dictionary["Runtime"]!
        self.genre = dictionary["Genre"]!
        self.director = dictionary["Director"]!
        self.writer = dictionary["Writer"]!
        self.actors = dictionary["Actors"]!
        self.plot = dictionary["Plot"]!
        self.language = dictionary["Language"]!
        self.country = dictionary["Country"]!
        self.awards = dictionary["Awards"]!
        self.poster = dictionary["Poster"]!
        self.metaScore = dictionary["Metascore"]!
        self.imdbRating = dictionary["imdbRating"]!
        self.imdbVotes = dictionary["imdbVotes"]!
        self.imdbID = dictionary["imdbID"]!
        self.type = dictionary["Type"]!
        self.response = dictionary["Response"]!
    }
    
    
}
