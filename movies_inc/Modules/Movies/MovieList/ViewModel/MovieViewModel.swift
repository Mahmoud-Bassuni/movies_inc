//
//  MovieViewModel.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
struct MovieViewModel {
    
    private let movie: MoviesModelResult
    
    init(_ _movie: MoviesModelResult) {
        self.movie = _movie
    }
}

extension MovieViewModel {
    var id: Int {
        return movie.id ?? 0
    }
    var title: String {
        return  movie.title ?? ""
    }
    var voteAverage: Double {
        return movie.voteAverage ?? 0.0
    }
    var releaseDate: String {
        return movie.releaseDate ?? ""
    }
    var posterPath: URL? {
        return URL(string: "\(EndPoint.imageDomain.rawValue)\(movie.posterPath ?? "" )")
    }
    
}
