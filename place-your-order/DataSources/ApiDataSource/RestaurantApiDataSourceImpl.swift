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
    
    public static let shared = RestaurantApiDataSourceImpl()
    
    public func loadRestaurantInformationBy(id: Int, _ callback: @escaping (BaseCallback<CompanyInformation>) -> Void) {
    
    }
}


