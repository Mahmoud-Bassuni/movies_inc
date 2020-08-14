//
//  MovieRankViewModel.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import RxSwift
class MovieRankViewModel {
    
    var movieId = 0
    var rankValue = 0.0
    let movieRepository : MovieRepository?
    let onShowError = PublishSubject<String>()
    let onSuccess = PublishSubject<Bool>()
    init(_ _movieRepository : MovieRepository) {
        self.movieRepository = _movieRepository
    }
    
    deinit {
        print("MovieRankViewModel ---- > deinit")
    }
    
    
    func SubmitMovieRank() {
        movieRepository?.submitMovieRank(movieId: movieId, rankValue: rankValue)
        {
            [weak self] result in
            switch result {
            case .success(let resp):
                resp.success ?
                    self?.onSuccess.onNext(true) :
                    self?.onShowError.onNext("there is error please try again")
                
            case .failure(let error):
                self?.onShowError.onNext(error.message)
                
            }
        }
    }
}
