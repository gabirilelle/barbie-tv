//
//  UpcomingCollectionViewCell.swift
//  Barbie tv
//
//  Created by Gabrielle on 18/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    func setup(title:String, year: String, image:UIImage){
        titleLabel.text = title
        dateLabel.text = year
        imageView.image = image
    }
    
    
    
    
    
    
}



