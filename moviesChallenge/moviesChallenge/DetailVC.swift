//
//  DetailVC.swift
//  moviesChallenge
//
//  Created by Jacqueline Minneman on 1/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class DetailVC: UIViewController {
    
    var movie: Movie!
    var movieInfo: MovieInfo!
    var store = MoviesDataStore.sharedInstance
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var leoLabel: UILabel!
    
    @IBAction func addToFavoritesPressed(_ sender: Any) {
        let newFavorite = Film(context: store.persistentContainer.viewContext)
        newFavorite.title = movie.title
        store.saveContext()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie.title
        
        if let url = URL(string: self.movie.poster) {
            if let data = NSData(contentsOf: url) {
                self.imageView.image = UIImage(data: data as Data)
            }
        }
        
        leoChecker()
    }
    
    
    
    func leoChecker(){
        if store.movieInfo.actors.contains("Leonardo DiCaprio") {
            print("Yes LEO!")
            leoLabel.text = "Features Leonardo DiCaprio? YES!"
        } else {
            leoLabel.text = "Features Leonardo DiCaprio? No :("
        }
    }
    
}
