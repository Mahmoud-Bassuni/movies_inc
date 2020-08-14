//
//  ServiceLayer.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//


import Foundation
import Alamofire

protocol ServiceLayer : URLRequestConvertible {
    
    var method:HTTPMethod { get }
    
    var parameters:[String:Any]? {get}
    
    var path: String {get}
    
    var encoding: ParameterEncoding{get}
    
    var baseUrl:URL {get}
    
    var headers: [String:String]? {get}
    
    
}

extension ServiceLayer {
    
var baseUrl:URL {
    return URL(string: EndPoint.baseUrl.rawValue)!
      }
    
    var headers: [String : String]? {
        
        return ["Content-Type" : "application/json",
                "Authorization" :  themovieDbToken ]
    }
    
    var encoding:ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.queryString
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return try encoding.encode(urlRequest, with: parameters)
        
    }
}
