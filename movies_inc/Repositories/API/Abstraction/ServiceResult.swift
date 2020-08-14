//
//  ServiceResult.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
enum RequestResult<T> {
    
    case success(T)
    case failure(ApiError)
    
}
