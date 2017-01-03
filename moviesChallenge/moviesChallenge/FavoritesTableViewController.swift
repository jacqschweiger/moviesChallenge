//
//  FavoritesTableViewController.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/3/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class FavoritesTableViewController: UITableViewController {
    
    var store = MoviesDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.favoriteMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        let movie = store.favoriteMovies[indexPath.row]
        cell.textLabel?.text = movie.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            store.favoriteMovies.remove(at: indexPath.row)
        }

        store.saveContext()
        
        tableView.reloadData()
    }
    
    
}
