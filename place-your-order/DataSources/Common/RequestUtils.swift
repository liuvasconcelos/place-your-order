//
//  RequestUtils.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

struct RequestUtils {
    
    public static func buildRequest(path: String, method: HTTPMethod) -> URLRequest {
        let urlRequest = RemoteUtils.buildUrl(path)
        var request    = URLRequest(url: URL(string: urlRequest)!)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}
