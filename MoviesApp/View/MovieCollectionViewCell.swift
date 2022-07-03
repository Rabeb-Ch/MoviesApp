//
//  MovieCollectionViewCell.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 2/7/2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var posterContainer: UIView!
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 15

    }

    func configureData(movie : Movie){
        self.movieTitle.text = movie.title
        self.releaseDate.text = movie.releaseDate?.getDateWithFormat(withFormat: "dd-MM-yyyy")
        self.moviePoster?.downloadImage(fromURLString : movie.posterPath)
        self.voteAverageLabel.text = "\(movie.voteAverage)"
        self.posterContainer.applyshadowWithCorner(containerView: self.container, cornerRadious: 8)
    }
    
}
