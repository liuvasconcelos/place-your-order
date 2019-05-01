//
//  Category.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class Category: Codable, Mappable {
    
    var numericalId: Int?
    var name: String?
    var parent: String?
    var brand: String?
    var id: String?
    var image: String?
    var order: Int?
    
    init(numericalId: Int, name: String, parent: String, brand: String, id: String, image: String, order: Int) {
        self.numericalId = numericalId
        self.name        = name
        self.parent      = parent
        self.brand       = brand
        self.id          = id
        self.image       = image
        self.order       = order
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        numericalId <- map["numericalId"]
        name        <- map["name"]
        parent      <- map["parent"]
        brand       <- map["brand"]
        id          <- map["id"]
        image       <- map["image"]
        order       <- map["order"]
    }
}
