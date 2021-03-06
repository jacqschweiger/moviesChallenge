//
//  ViewController.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

/*
 
 TODO: Use MVVM.
 
 DONE: A user should be able to tap on a cell and see a detail view with information about the movie.
 
 DONE: If the movie contains "Leonardo DiCaprio" as one of its actors, then the cell and detail view should indicate that in some way.
 
 DONE A user should be able to search for movies or TV shows to then view them in a UICollectionView or UITableView (your choice).
 
 DONE A user should be able to favorite films. These films that were "favorited" should be persisted using Core Data.
*/

import UIKit

class SearchViewController: UIViewController {
    
    var store = MoviesDataStore.sharedInstance

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO: disable search button if textfield is empty
        
        if textField.text?.isEmpty == false {
            searchInput = self.textField.text!
        } else {
            searchInput = "hi"
        }
        
        self.store.getMoviesFromAPI {
        }
        
        if segue.identifier == "showResults" {
            let dest = segue.destination as! ResultsCollectionVC
        }        
    }

}

