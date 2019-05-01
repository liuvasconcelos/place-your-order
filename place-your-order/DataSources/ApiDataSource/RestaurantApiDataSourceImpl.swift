//
//  RestaurantApiDataSourceImpl.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import Alamofire

public class RestaurantApiDataSourceImpl: RestaurantApiDataSource {
    
    public static var shared = RestaurantApiDataSourceImpl()
    
    public func loadRestaurantInformationBy(id: Int, _ callback: @escaping (BaseCallback<CompanyInformation>) -> Void) {
        let path = "/v1/mobile/company/\(id)"
        let request = RequestUtils.getRequest(path: path, method: .get)
        
        Alamofire.request(request).validate(statusCode: 200..<299).responseObject { (response: DataResponse<CompanyInformation>) in
            switch response.result {
            case .success:
                if let response = response.result.value {
                    let callbackSuccess = BaseCallback.success(response)
                    callback(callbackSuccess)
                }
                
            case .failure(let error):
                let callbackFailed = BaseCallback<CompanyInformation>.failed(error: error.localizedDescription)
                callback(callbackFailed)
            }
        }
    }
}


