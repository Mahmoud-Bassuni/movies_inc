//
//  MovieDeatilsModelCodable.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//


import Foundation

// MARK: - MovieDeatilsModelCodable
struct MovieDeatilsModelCodable: Codable {
    let id: Int!
    let title, releaseDate, overview : String!
    let genres: [Genre]!
    let posterPath: String!
    let voteAverage: Double!
    
    enum CodingKeys: String, CodingKey {
        case id, genres, overview , title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

