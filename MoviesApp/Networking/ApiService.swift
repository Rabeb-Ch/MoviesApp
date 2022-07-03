//
//  ApiService.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 2/7/2022.
//
import Foundation

enum ApiUrls : String {
    case baseUrl = "https://api.themoviedb.org/3/"
    case imageBaseUrl = "https://image.tmdb.org/t/p/w500"
}
enum Endpoints : String {
    case movieList = "discover/movie"
    case movieDetails = "movie/"
}
