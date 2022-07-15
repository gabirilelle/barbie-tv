//
//  DetailsViewController.swift
//  Barbie tv
//
//  Created by Gabrielle on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       
        
        
        guard let movie = movie else {
            return
        }

        self.title = movie.title
        self.backdropImage.image = UIImage(named: movie.backdropPath)
        self.titleLabel.text = movie.title
        self.posterImage.image = UIImage(named: movie.posterPath)
        self.ratingLabel.text =  "Rating: \(movie.voteAverage)/10"
        self.overviewLabel.text = movie.overview
        
    }
    
    
}
