//
//  FeaturedViewController.swift
//  filminho
//
//  Created by michellyes on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = []//= Movie.popularMovies()
    var nowPlayingMovies: [Movie] = []//= Movie.nowPlayingMovies()
    var upcomingMovies: [Movie] = [] //= Movie.upcomingMovies()
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView! // 1
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self // 2
        upcomingCollectionView.dataSource = self
    
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self //3
        upcomingCollectionView.delegate = self
        
        
        Task { // p nowPlaying é outra task, n aq dentro
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
            
        }
        
        Task {
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
        }
        
        Task {
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
        }

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // passar filme adiante
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
}

