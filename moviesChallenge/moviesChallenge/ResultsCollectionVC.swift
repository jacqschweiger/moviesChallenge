//
//  ResultsCollectionVC.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class ResultsCollectionVC: UICollectionViewController  {
    
    let store = MoviesDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.store.getMoviesFromAPI {
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! ResultsCollectionViewCell
        cell.backgroundColor = UIColor.blue
        
        let movie = store.movies[indexPath.item]
        cell.cellLabel.text = movie.title
        
        if let url = URL(string: store.movies[indexPath.item].poster) {
            if let data = NSData(contentsOf: url) {
                cell.imageView.image = UIImage(data: data as Data)
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            let dest = segue.destination as! DetailVC
            
            if let indexPath = collectionView?.indexPathsForSelectedItems?[0].item {
                print("1")
                dest.movie = store.movies[indexPath]
                movieTitle = store.movies[indexPath].title
            }
            
            store.getMovieInfoFromAPI {
                print("4")
            }
        }
        
        if segue.identifier == "showFavorites" {
            let dest = segue.destination as! FavoritesTableViewController
        }
    }
    
    
}
