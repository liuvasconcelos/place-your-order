//
//  OpeningHours.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

public class OpeningHours: Codable {
    
    var day: Int?
    var timeFrom: String?
    var timeTo: String?
    
    init(day: Int, timeFrom: String, timeTo: String) {
        self.day      = day
        self.timeFrom = timeFrom
        self.timeTo   = timeTo
    }
    
    enum CodingKeys: String, CodingKey {
        case day, timeFrom, timeTo
    }
}
