//
//  Menu.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class Menu: Codable, Mappable {
    
    var numericalId: Int?
    var id: String?
    var categories: [String]?
    
    init(numericalId: Int, id: String, categories: [String]) {
        self.numericalId = numericalId
        self.id          = id
        self.categories  = categories
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        numericalId <- map["numericalId"]
        id          <- map["id"]
        categories  <- map["categories"]
    }
}
