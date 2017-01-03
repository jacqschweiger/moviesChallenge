//
//  MoviesDataStore.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MoviesDataStore {
    
    static let sharedInstance = MoviesDataStore()
    
    private init() {}
    
    var movies: [Movie]!
    var favoriteMovies: [Movie] = []
    var movieInfo: MovieInfo!
    
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
    
    func getFullMovieInfoFromAPI(completion: @escaping ()->()) {
        
        MoviesAPIClient.getFullMovieInfo { (result) in
            var newMovieInfo = MovieInfo(dictionary: result)
            newMovieInfo = self.movieInfo
        }
        
        completion()

    }
    
    //MARK: Core Data
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "moviesChallenge")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData(){
//        let context = persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<Movieorfilm>(entityName: "Movieorfilm")
//        
//        do {
//            let movies = try context.fetch(fetchRequest)
//        } catch {
//            print("error")
//        }
    }

    
    func generateTestData() {
        
        
//        let context = persistentContainer.viewContext
//        
//        let author1 = Author(context: context)
//        author1.name = "Apple Inc."
//        let author2 = Author(context: context)
//        author2.name = "Paul Hudson"
//        let author3 = Author(context: context)
//        author3.name = "Chris Eidhof"
//        
//        
//        
//        let book1 = Book(context: context)
//        book1.title = "The Swift Programming Language"
//        let book2 = Book(context: context)
//        book2.title = "Hacking with Swift"
//        let book3 = Book(context: context)
//        book3.title = "Pro Swift"
//        let book4 = Book(context: context)
//        book4.title = "Advanced Swift"
        
        
//        author1.addToBooks(book1)
//        author2.addToBooks(book2)
//        author2.addToBooks(book3)
//        author3.addToBooks(book4)
        
        //saveContext()
    }
    
    

    
}

