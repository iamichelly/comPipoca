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
            let imageData = await Movie.downloadImageData(withPath: movie.backdrop)
            let imagem = UIImage(data: imageData) ?? UIImage()
            self.backdropImage.image = imagem //UIImage(named: movie.backdrop)
        }

        
        self.title = movie.title
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.poster)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
        
        


    }
    

    

}
