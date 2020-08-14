//
//  MovieActorViewModel.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
struct MovieActorViewModel {
    private let actor: Cast
    init(_ _actor: Cast) {
        self.actor = _actor
    }
}

extension MovieActorViewModel {
    var id: Int {
        return actor.castID ?? 0
    }
    var characterName: String {
        return  actor.character ?? ""
    }
    var actorName: String {
        return actor.name ?? ""
       }
    
    var order: Int {
        return actor.order ?? 0
          }

    var posterPath: URL? {
        return URL(string: "\(EndPoint.imageDomain.rawValue)\(actor.profilePath ?? "" )")
    }
    
    
}


