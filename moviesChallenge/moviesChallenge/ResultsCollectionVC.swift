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
        
        print("hi")
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.movies.count
    }
}
