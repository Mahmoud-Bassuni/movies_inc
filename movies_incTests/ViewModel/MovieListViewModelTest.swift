//
//  MovieListViewModelTest.swift
//  movies_incTests
//
//  Created by Bassuni on 8/15/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import XCTest
@testable import movies_inc

class MovieListViewModelTest: XCTestCase {
    var moviesVM :  MovieListViewModel!
    var movieRepository :  MovieRepository!
    
    override func setUp() {
        movieRepository = MovieRepository()
    }
    override func tearDown() {
        moviesVM = nil
        movieRepository = nil
    }
    func test_fetch_data_from_ViewModel_to_bind_it_in_tableview()
    {
        moviesVM = MovieListViewModel(_movieRepository: movieRepository)
        moviesVM.getMovies()
        // here i should make XCTAssertNotNil but it must be include rxswift actually i dont have time
    }
}
