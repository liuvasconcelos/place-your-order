//
//  ProductList.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class ProductList: Codable, Mappable {
    
    var nextPage: String?
    var products: [Product]?
    var repeatable: Bool?
    var width: Int?
    var height: Int?
    
    init(nextPage: String, products: [Product]) {
        self.nextPage = nextPage
        self.products = products
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        nextPage <- map["pagination.next"]
        products <- map["data"]
    }
}
