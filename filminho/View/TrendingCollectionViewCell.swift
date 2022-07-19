//
//  TrendingCollectionViewCell.swift
//  filminho
//
//  Created by michellyes on 19/07/22.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "trendingCell"
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(image: UIImage, title: String, year: String){
        self.imageView.image = image
        titleLabel.text = title
        dateLabel.text = year
    }
    
}
