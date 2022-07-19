//
//  TrendingViewController.swift
//  filminho
//
//  Created by michellyes on 19/07/22.
//

import UIKit

class TrendingViewController: UIViewController, UICollectionViewDelegate {
    
    
    var trendingMovies: [Movie] = []
    
    @IBOutlet var trendingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingCollectionView.dataSource = self
        
        trendingCollectionView.delegate = self
        
        Task {
            self.trendingMovies = await Movie.trendingMoviesAPI()
            self.trendingCollectionView.reloadData()
        }
        
    }
    
    
}


