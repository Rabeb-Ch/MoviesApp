//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 2/7/2022.
//

import Foundation

class MovieDetailsViewModel {
    var movieDetails : MovieDetails?
    
    func getMovieDetails(withId id:Int,completion:@escaping(Result<MovieDetails,Error>)-> Void){
        guard let url = URL(string: ApiUrls.baseUrl.rawValue + Endpoints.movieDetails.rawValue + "\(id)" + NetworkManager.addApiKey) else {
            return
        }
        NetworkManager.sharedInstance.fetchAPI(fromURL: url, forType: MovieDetails.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movieDetails = response
                completion(.success(response))
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
    
}
extension MovieDetailsViewModel {
    var movieTitle : String {
        return movieDetails?.title ?? ""
    }
    var overview : String {
        return movieDetails?.overview ?? ""
    }
    var posterPath : String {
        return movieDetails?.posterPath ?? ""
    }
    var voteAverage : String {
        return "\(movieDetails?.voteAverage ?? 0)"
    }
    var releaseDate : String {
        return self.getReleaseDateWithFormat(withFormat: "yyyy") ?? ""
    }
    func getReleaseDateWithFormat(withFormat format: String) -> String? {
        guard let movieDetails = movieDetails, let date = movieDetails.releaseDate  else {
            return ""
        }
        return date.getDateWithFormat(withFormat: format)
    }
    
}
