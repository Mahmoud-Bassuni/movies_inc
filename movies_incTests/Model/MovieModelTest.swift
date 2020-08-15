//
//  MovieModelTest.swift
//  movies_incTests
//
//  Created by Bassuni on 8/15/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//


import Foundation
import XCTest

class MovieModelTest: XCTestCase {

    func test_Successful_Init_Movie_Model() {
        let testSuccessfulJSON: JSON = ["posterPath": "https://www.image.com",
                                        "id": 1,
                                        "title": "face off",
                                        "voteAverage" : 2.8,
                                        "releaseDate" : "1-1-2000"]
        XCTAssertNotNil(MoviesModelResult(json: testSuccessfulJSON))
    }
}

private extension MoviesModelResult {
    init?(json: JSON) {
        
        guard let posterPath = json["posterPath"] as? String,
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
              let voteAverage = json["voteAverage"] as? Double,
            let releaseDate = json["releaseDate"] as? String else {
                return nil
        }
    
        self.posterPath = posterPath
        self.id = id
        self.title = title
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
       
    }
}

typealias JSON = Dictionary<String, Any>
