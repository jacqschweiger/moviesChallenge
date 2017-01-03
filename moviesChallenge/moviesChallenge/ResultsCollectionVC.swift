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
        
        print("viewdidload")
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("collectionview count loading")
        return store.movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! ResultsCollectionViewCell
        cell.backgroundColor = UIColor.blue
        let movie = store.movies[indexPath.item]
        cell.cellLabel.text = movie.title
        
        if let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/2009-08-16_Puppy_at_Duke_East_2.jpg/399px-2009-08-16_Puppy_at_Duke_East_2.jpg") {
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
                dest.textValue = store.movies[indexPath].title
            }
        }
    }
    
}
