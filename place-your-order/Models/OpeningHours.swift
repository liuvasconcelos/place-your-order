//
//  OpeningHours.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class OpeningHours: Codable, Mappable {
    
    var day: Int?
    var timeFrom: String?
    var timeTo: String?
    
    init(day: Int, timeFrom: String, timeTo: String) {
        self.day      = day
        self.timeFrom = timeFrom
        self.timeTo   = timeTo
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        day      <- map["day"]
        timeFrom <- map["timeFrom"]
        timeTo   <- map["timeTo"]
    }
}
