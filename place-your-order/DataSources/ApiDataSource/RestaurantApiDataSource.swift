//
//  RestaurantApiDataSource.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

public protocol RestaurantApiDataSource: class {
    func loadRestaurantInformationBy(id: Int, _ callback: @escaping (BaseCallback<CompanyInformation>) -> Void)
}

