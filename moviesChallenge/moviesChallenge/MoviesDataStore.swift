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
    var movieInfo: MovieInfo!
    var favoriteMovies = [Film]()
    
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
    
    func getMovieInfoFromAPI(completion: @escaping ()->()) {
        
        MoviesAPIClient.getFullMovieInfo { (results) in
            let newMovieInfo = MovieInfo(dictionary: results)
            self.movieInfo = newMovieInfo
            print(results)
            print(newMovieInfo.year)
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
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Film>(entityName: "Film")
        
        do {
            let favoriteMovies = try context.fetch(fetchRequest)
            self.favoriteMovies = favoriteMovies
        } catch {
            print("error")
        }
        
    }
    
    func deleteData(indexPath: Int){
        let context = persistentContainer.viewContext
        
        context.delete(self.favoriteMovies[indexPath] as NSManagedObject)
        self.favoriteMovies.remove(at: indexPath)
        
        let _ : NSError! = nil
        
        do {
            try context.save()
        } catch {
            print("error : \(error)")
        }
    }
    
}

