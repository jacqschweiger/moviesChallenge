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

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if textField.text?.isEmpty == false {
            searchInput = self.textField.text!
            print("1")
        } else {
            searchInput = "hi"
        }
        
        store.getMoviesFromAPI {
            print("2")
            print("3")
        }
        
        if segue.identifier == "showResults" {
            let dest = segue.destination as! ResultsCollectionVC
            print("4")
            
        }
        
        
    }

}

