//
//  MovieCastingModelCodable.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//


import Foundation


struct MovieCastingModelCodable: Codable {
    let cast: [Cast]!
}

// MARK: - Cast
struct Cast: Codable {
    let castID: Int!
    let character : String!
    let name: String!
    let order: Int!
    let profilePath: String!

    enum CodingKeys: String, CodingKey {
        case castID = "cast_id"
        case character
        case name, order
        case profilePath = "profile_path"
    }
}

