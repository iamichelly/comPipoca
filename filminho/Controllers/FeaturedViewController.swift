//
//  FeaturedViewController.swift
//  filminho
//
//  Created by michellyes on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    let popularMovies = Movie.popularMovies()
    let nowPlayinhMovies = Movie.nowPlayingMovies()
    //let upcomingMovies = Movie.upcomingMovies()
    
    
   
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView! // 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self // 2

        
    }

    
}

