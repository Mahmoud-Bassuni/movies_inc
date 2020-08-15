//
//  ApiResponseHandler.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import Alamofire
class ApiResponseHandler {
    
    static let shared = ApiResponseHandler()
    private init() { }
    
    func performRequest<T:Decodable>( route:ServiceLayer, completion: @escaping (RequestResult<T>) -> Void)  {
        
        call(route) { result in
            
            switch result {
            case .success(let data):
                
                let decoder = JSONDecoder()
                do {
                    let resp = try decoder.decode(T.self, from: data)
                    completion(.success(resp))
                }
                catch {
                    let err = ApiError(status: 0, message: error.localizedDescription)
                    completion(.failure(err))
                }
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}

extension ApiResponseHandler {
    
    private func call(_ route: ServiceLayer, completion: @escaping (RequestResult<Data>) -> Void) {
        AFSessionManager.shared.session.request(route).validate(statusCode: 200..<299).responseData { (response) in
            
            guard ConnectionManger.shared.isReachable else {
                completion(.failure(ApiError(status: 0, message: "no Internet Access")))
                return
            }
            
            switch response.result {
                
            case .success(let data):
                completion(.success(data))
                
            case .failure( let error):
               
                completion(.failure(ApiError(status: 0, message: error.errorDescription ?? "Something went wrong try again later")))
            }
        }
    }
    
}

class AFSessionManager {
    static let shared = AFSessionManager()
    let session = Session(interceptor: MpInterceptor(),eventMonitors: [Logger()])
}
