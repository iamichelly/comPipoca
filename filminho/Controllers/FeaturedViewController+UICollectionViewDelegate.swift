//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  filminho
//
//  Created by michellyes on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie: Movie
        if collectionView == popularCollectionView {
            //print(popularMovies[indexPath.item])
            movie = popularMovies[indexPath.item]
        } else {  // else if collectionView == nowPlayingCollectionView {func auqui} else { aqui o caso p upcoming
            //print(nowPlayinhMovies[indexPath.item])
            movie = nowPlayinhMovies[indexPath.item]
        }
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
