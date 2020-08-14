//
//  Logger.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import Alamofire

class Logger: EventMonitor {
    
    // Event called when any type of Request is resumed.
    func requestDidResume(_ request: Request) {
        #if DEBUG
        print("Started Log: \(request.cURLDescription().debugDescription)")
        #endif
    }
    
    // Event called whenever a DataRequest has parsed a response.
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        #if DEBUG
        guard let responseData = response.data else { return}
       
        print("=========================================================")
        print("Finished Log : \(request) \n \(responseData.prettyPrintedJSONString ?? "Faild to serialize object!")")
        print("=========================================================")
        #endif
    }
}

