//
//  MovieListViewModel.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MovieListViewModel {
    
    private(set) var movies = BehaviorRelay<[MoviesModelResult?]>(value: [])
    let onShowError = PublishSubject<String>()
    
    let movieRepository : MovieRepository?
    weak var coordinator: MovieCoordinator?
    
    init(_movieRepository : MovieRepository) {
        self.movieRepository = _movieRepository
    }
    
    func getMovies()
    {
        movieRepository?.getMovieList()
            {
                [weak self] result in
                switch result {
                case .success(let resp):
                    if let response =  resp.results  {
                        self?.movies.accept(response.sorted { $0.title.lowercased() < $1.title.lowercased() })
                    }
                case .failure(let error):
                    self?.onShowError.onNext(error.message)
                    
                }
        }
    }
    
    func moviesAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movies.value[index]
        return MovieViewModel(movie!)
    }
}

