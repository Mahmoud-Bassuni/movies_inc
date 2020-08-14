//
//  MovieRouter.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import Alamofire

enum MovieRouter {
    case getMovieList
    case getMovieDetails(id : Int)
    case getMovieCasting(movieId : Int)
    case createNewSession
    case createRate(value : Double)
}

extension MovieRouter: ServiceLayer {
    
    var path: String {
        switch self {
            
        case .getMovieList:
            return EndPoint.movieNowPlayingURL.rawValue
            
        case let .getMovieDetails(id):
            return String(format:EndPoint.movieDetailsURL.rawValue,"\(id)")
            
        case .createNewSession:
            return EndPoint.createNewSessionURL.rawValue
            
        case .createRate:
            return EndPoint.movieRatingURL.rawValue
        case let .getMovieCasting(movieId):
            return String(format:EndPoint.movieCastURL.rawValue,"\(movieId)")
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
            
        case  .getMovieList: return ["language": "en-US","page":1] // first page only as per requirement
        case  .createNewSession: return nil
        case  .getMovieDetails: return ["language": "en-US"]
        case  .getMovieCasting: return ["language": "en-US"]
        case let .createRate(value): return ["language": "en-US","value":value]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovieList , .getMovieDetails , .createNewSession ,.getMovieCasting : return .get
        case .createRate : return .post
            
        }
        
    }
    
}
