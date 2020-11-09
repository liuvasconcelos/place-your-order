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
        
        let path = RemoteUtils.buildUrl("\(RemoteUtils.companyPath)\(id)")
        
        guard let url = URL(string: path) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    callback(BaseCallback.failed())
                    return }
            let decoder = JSONDecoder()
            do {
                let information = try decoder.decode(CompanyInformation.self, from: dataResponse)
                
                if information.numericalId == nil {
                    callback(BaseCallback.emptyData())
                } else {
                    callback(BaseCallback.success(information))
                }
            } catch {
                callback(BaseCallback.failed())
            }
            
        }
        task.resume()
    }
    
    public func loadRestaurantProductsBy(companyId: Int, _ callback: @escaping (BaseCallback<ProductList>) -> Void) {
        let path = RemoteUtils.productsPath(companyId: companyId)
        let request = RequestUtils.buildRequest(path: path, method: .get)
        
        Alamofire.request(request).validate(statusCode: 200..<299).responseObject { (response: DataResponse<ProductList>) in
            switch response.result {
            case .success:
                if let response = response.result.value {
                    let callbackSuccess = BaseCallback.success(response)
                    callback(callbackSuccess)
                }
                
            case .failure(let error):
                let callbackFailed = BaseCallback<ProductList>.failed(error: error.localizedDescription)
                callback(callbackFailed)
            }
        }
    }
    
}


