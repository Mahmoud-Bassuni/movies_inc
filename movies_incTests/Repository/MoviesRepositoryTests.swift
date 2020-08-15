//
//  MoviesServiceTests.swift
//  movies_incTests
//
//  Created by Bassuni on 8/15/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import XCTest
@testable import movies_inc

class MoviesServiceTests: XCTestCase {
    var movieRepository :  MovieRepository!
    
    override func setUp() {
        movieRepository = MovieRepository()
    }
    
    override func tearDown() {
        movieRepository = nil
    }
    
    func test_Fetch_Movies_Data() {
        
        movieRepository?.getMovieList()
            {
                result in
                switch result {
                case .success(let resp):
                    if let response =  resp.results  {
                        XCTAssertNotNil(response)
                
                    }
                case .failure(let error):
                    print(error.message)
                    
                }
        }
        
        
    }
}
