//
//  DetailsViewController.swift
//  filminho
//
//  Created by michellyes on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let movie = movie else {
            return
        }
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.backdropImage.image = imagem //UIImage(named: movie.backdrop)
            
            let imageData1 = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagem1 = UIImage(data: imageData1) ?? UIImage()
            self.posterImage.image = imagem1
            //posterImage.image = UIImage(named: movie.posterPath)
        }

        
        self.title = movie.title
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
        
        


    }
    

    

}
