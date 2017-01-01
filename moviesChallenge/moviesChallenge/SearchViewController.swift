//
//  ViewController.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

/*
 A user should be able to search for movies or TV shows to then view them in a UICollectionView or UITableView (your choice).
 
 A user should be able to tap on a cell and see a detail view with information about the movie.
 
 If the movie contains "Leonardo DiCaprio" as one of its actors, then the cell and detail view should indicate that in some way.
 
 A user should be able to favorite films. These films that were "favorited" should be persisted using Core Data.
 
 Use MVVM.
*/

import UIKit

class SearchViewController: UIViewController {
    
    var store = MoviesDataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.getMoviesFromAPI {
            print(self.store.movies[0].title)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

