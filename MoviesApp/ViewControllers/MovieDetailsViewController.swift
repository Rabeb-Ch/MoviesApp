//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 2/7/2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDetailsTextView: UITextView!
    @IBOutlet weak var posterContainer: UIView!
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    var movieDetailsViewModel = MovieDetailsViewModel()
    var movieId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView?.tintColor = .systemYellow
        
        movieDetailsViewModel.getMovieDetails(withId: movieId!){ [weak self] result in
            switch result {
            case .success(let response):
                self?.movieDetailsViewModel.movieDetails = response
                DispatchQueue.main.async {
                    self?.refreshData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        createSpinnerView()
    }

    func refreshData(){
        self.movieTitleLabel.text = movieDetailsViewModel.movieTitle + " (\(movieDetailsViewModel.releaseDate))"
        self.movieDetailsTextView.text = movieDetailsViewModel.overview
        self.moviePoster?.downloadImage(fromURLString : movieDetailsViewModel.posterPath)
        self.moviePoster.applyshadowWithCorner(containerView : posterContainer, cornerRadious : 8)
        self.background.image = self.moviePoster.image
        self.voteAverageLabel.text = movieDetailsViewModel.voteAverage
    }
    

}
