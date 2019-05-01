//
//  Category.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

public class Category: Codable {
    
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
  
    enum CodingKeys: String, CodingKey {
        case numericalId, name, parent, brand, id, image, order
    }
}
