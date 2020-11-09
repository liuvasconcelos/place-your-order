//
//  Image.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

public class Image: Codable {
    
    var url: String?
    var context: String?
    var repeatable: Bool?
    var width: Int?
    var height: Int?
    
    init(url: String, context: String, repeatable: Bool, width: Int, height: Int) {
        self.url        = url
        self.context    = context
        self.repeatable = repeatable
        self.width      = width
        self.height     = height
    }
    
    enum CodingKeys: String, CodingKey {
        case url, context, repeatable, width, height
    }
}
