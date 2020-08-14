//
//  MovieDetailsViewModel.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MovieDetailsViewModel {
    
    private(set) var movie = BehaviorRelay<MovieDetailsModel?>(value: nil)
    private(set) var movieActor = BehaviorRelay<[Cast?]>(value: [])
    let onShowError = PublishSubject<String>()
    let movieRepository : MovieRepository?
    var movieId = 0
     weak var coordinator: MovieCoordinator?
    init(_movieRepository : MovieRepository) {
        self.movieRepository = _movieRepository
    }
    
    deinit {
        print("MovieDetailsViewModel ---- > deinit")
    }
    
    func getMovieDetails() {
        getMovieActor()
        movieRepository?.getMovieDetails(movieId: movieId)
            {
                [weak self] result in
                switch result {
                case .success(let resp):
                        self?.movie.accept(MovieDetailsModel(resp))
                case .failure(let error):
                    self?.onShowError.onNext(error.message)
                    
                }
        }
    }
    func getMovieActor() {
        movieRepository?.getMovieCasting(movieId: movieId)
            {
                [weak self] result in
                switch result {
                case .success(let resp):
                    if let response = resp.cast {
                        self?.movieActor.accept(response)
                    }
                        
                case .failure(let error):
                    self?.onShowError.onNext(error.message)
                    
                }
        }
    }
    
    func actorsAtIndex(_ index: Int) -> MovieActorViewModel {
        let actor = self.movieActor.value[index]
           return MovieActorViewModel(actor!)
       }
}

struct MovieDetailsModel {
    private let movie: MovieDeatilsModelCodable
    init(_ _movie: MovieDeatilsModelCodable) {
        self.movie = _movie
    }
}

extension MovieDetailsModel {
    var id: Int {
        return movie.id ?? 0
    }
    var title: String {
        return  movie.title ?? ""
    }
    var releaseDate: String {
           return movie.releaseDate ?? ""
       }
    
    var overview: String {
           return movie.overview ?? ""
       }
    
    var genres: String {
           var genre = " "
           movie.genres.forEach({genre += " \($0.name)"})
           return genre
       }
    
    var voteAverage: Double {
        return movie.voteAverage ?? 0.0
    }

    var posterPath: URL? {
        return URL(string: "\(EndPoint.imageDomain.rawValue)\(movie.posterPath ?? "" )")
    }
    
    
}


