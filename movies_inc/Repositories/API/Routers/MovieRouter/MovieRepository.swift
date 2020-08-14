//
//  MovieRepository.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
class MovieRepository {
    
    func getMovieList(completion:@escaping (RequestResult<MoviesModelCodable>) -> Void) {

        ApiResponseHandler.shared.performRequest(route: MovieRouter.getMovieList, completion: completion)
    
        }
    func getMovieDetails(movieId : Int , completion:@escaping (RequestResult<MovieDeatilsModelCodable>) -> Void) {

        ApiResponseHandler.shared.performRequest(route: MovieRouter.getMovieDetails(id: movieId), completion: completion)
       
           }
    
    func getMovieCasting(movieId : Int , completion:@escaping (RequestResult<MovieCastingModelCodable>) -> Void) {

        ApiResponseHandler.shared.performRequest(route: MovieRouter.getMovieCasting(movieId: movieId), completion: completion)
          
              }
    
    func createNewSession(completion:@escaping (RequestResult<SessionModelCodable>) -> Void) {

        ApiResponseHandler.shared.performRequest(route: MovieRouter.createNewSession, completion: completion)
    
        }
    
    func createMovieRank(rankValue : Double , completion:@escaping (RequestResult<SessionModelCodable>) -> Void) {

        ApiResponseHandler.shared.performRequest(route: MovieRouter.createRate(value: rankValue), completion: completion)
    
        }

}
