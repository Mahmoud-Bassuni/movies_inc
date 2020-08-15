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
    
    var baseUrl:String {get}
    
    var headers: [String:String]? {get}
    
    var query: [String:String]? {get}
    
    
}

extension ServiceLayer {
    
    var baseUrl:String {
        return EndPoint.baseUrl.rawValue
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json",
                "Authorization" :  themovieDbToken ]
    }
    
    var query: [String : String]? {
        return nil
    }
    
    var encoding:ParameterEncoding {
        switch method {
        case .get: return URLEncoding.queryString
        default: return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = baseUrl
        urlComponents.path = path
        if let query = query {
            urlComponents.setQueryItems(with: query)
        }
        var urlRequest = URLRequest(url: urlComponents.url!.absoluteURL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return try encoding.encode(urlRequest, with: parameters)
    }
}
extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
