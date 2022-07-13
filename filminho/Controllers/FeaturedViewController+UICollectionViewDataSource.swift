//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  filminho
//
//  Created by michellyes on 12/07/22.
//

import UIKit
extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayinhMovies.count
        } else {
            return 0
        }
        
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell {
            cell.titleLabel.text = popularMovies[indexPath.item].title
            cell.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            let titulo: String = nowPlayinhMovies[indexPath.item].title
            cell.titleLabel.text = titulo
            cell.dateLabel.text = String(nowPlayinhMovies[indexPath.item].releaseDate.prefix(4)) // pode ser assim tbm => "\String(nowPlayinhMovies[indexPath.item].releaseDate.prefix(4))"   essa linha ta forçando retornar a data da label em forma de string.... ela fazia isso antes mas ao usar o metodo de prefixo p/ voltar o valor inicial "quebrado"
            cell.imageView.image = UIImage(named: nowPlayinhMovies[indexPath.item].poster) // rename cell.image.image para cell imageView.image
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == nowPlayingCollectionView{
            return makeNowPlayingCell(indexPath)
        }
        
        return UICollectionViewCell()
    }
}
