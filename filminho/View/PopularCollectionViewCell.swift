//
//  PopularCollectionViewCell.swift
//  filminho
//
//  Created by michellyes on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "popularCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var image: UIImageView!
    
    
    func setup(title: String, image: UIImage) {
        titleLabel.text = title
        self.image.image = image
    }
    
}
