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
    //criar aqui a var p upcomingCollectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self // 2
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self //3

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // passar filme adiante
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
}

