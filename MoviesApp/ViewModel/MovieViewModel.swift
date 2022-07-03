//
//  MovieViewModel.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 2/7/2022.
//

import Foundation
import Combine

class MovieViewModel {
    @Published var movies : [Movie] = []
    var currentPage = 1

    func fetchMoviesList(){
        guard let url = URL(string: ApiUrls.baseUrl.rawValue + Endpoints.movieList.rawValue + NetworkManager.addApiKey + "&page=\(currentPage)") else {
            return
        }
        NetworkManager.sharedInstance.fetchAPI(fromURL: url, forType: MovieList.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies.append(contentsOf: response.results)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getNextPage(){
        currentPage+=1
        fetchMoviesList()
    }
}
