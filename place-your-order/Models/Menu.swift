//
//  Menu.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

public class Menu: Codable {
    
    var numericalId: Int?
    var id: String?
    var categories: [String]?
    
    init(numericalId: Int, id: String, categories: [String]) {
        self.numericalId = numericalId
        self.id          = id
        self.categories  = categories
    }
   
    enum CodingKeys: String, CodingKey {
        case numericalId, id, categories
    }
}
