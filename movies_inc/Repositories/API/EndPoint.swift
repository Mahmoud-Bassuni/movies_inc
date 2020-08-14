//
//  EndPoint.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
enum EndPoint: String{
    //MARK:- Movie
       case baseUrl = "https://api.themoviedb.org"
       case movieNowPlayingURL = "3/movie/now_playing"
       case movieDetailsURL = "/3/movie/%1$@"
       case createNewSessionURL = "3/authentication/guest_session/new"
       case movieRatingURL = "3/movie/521034/rating"
       case imageDomain = "https://image.tmdb.org/t/p/w500"
}

