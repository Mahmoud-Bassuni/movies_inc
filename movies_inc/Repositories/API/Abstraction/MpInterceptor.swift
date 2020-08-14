//
//  MpInterceptor.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import Alamofire
class MpInterceptor  : RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        // dont accept any request without header
        guard urlRequest.allHTTPHeaderFields != nil else {
            print("API must be contain header")
            return
            
        }
        completion(.success(urlRequest))
    }
}
