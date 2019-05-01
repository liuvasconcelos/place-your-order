//
//  Product.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class Product: Codable, Mappable {
    
    var name: String?
    var description: String?
    var images: [Image]?
    var price: String?
    var category: String?
    
    init(name: String, description: String, images: [Image], price: String, category: String?) {
        self.name        = name
        self.description = description
        self.images      = images
        self.price       = price
        self.category    = category
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name        <- map["name"]
        description <- map["fullDescription"]
        images      <- map["image"]
        price       <- map["price"]
        category    <- map["category"]
    }
}
