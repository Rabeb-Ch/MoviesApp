//
//  Movie.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 2/7/2022.
//

import Foundation
struct MovieList : Decodable {
    var results : [Movie]
}
struct Movie : Decodable {
    var id : Int
    var title : String
    var overview : String
    var posterPath : String
    var releaseDate : String?
    var voteAverage : Float
}
struct MovieDetails : Decodable {
    let posterPath : String?
    let title : String?
    let overview : String?
    var releaseDate : String?
    var voteAverage : Float?
}
