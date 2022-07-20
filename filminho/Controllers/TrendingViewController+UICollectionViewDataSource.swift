//
//  TrendingViewController+UICollectionViewDataSource.swift
//  filminho
//
//  Created by michellyes on 19/07/22.
//

import UIKit

extension TrendingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = trendingCollectionView.dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.cellIdentifier, for: indexPath) as? TrendingCollectionViewCell {
            
            cell.setup(image: UIImage(), title: trendingMovies[indexPath.item].title, year: "\(trendingMovies[indexPath.item].releaseDate.prefix(4))")
            
            let movie = trendingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(image: imagem, title: movie.title, year: String (movie.releaseDate.prefix(4)))
            }
            
            return cell
            
        }
        
        return UICollectionViewCell()
    }
}
