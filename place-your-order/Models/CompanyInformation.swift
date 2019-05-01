//
//  CompanyInformation.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

public class CompanyInformation: Codable {
    let decoder = JSONDecoder()
    
    var numericalId: Int?
    var latitude: String?
    var longitude: String?
    var openingTimes: [OpeningHours]?
    var images: [Image]?
    var address: String?
    var id: String?
    var categories: [Category]?
    var displayName: String?
    var name: String?
    var menuBrand: String?
    var menus: [Menu]?
    var brand: String?
    
    init(numericalId: Int, latitude: String, longitude: String, openingTimes: [OpeningHours], images: [Image], address: String, id: String, categories: [Category],
         displayName: String, name: String, menuBrand: String, menus: [Menu], brand: String) {
        
        self.numericalId  = numericalId
        self.latitude     = latitude
        self.longitude    = longitude
        self.images       = images
        self.address      = address
        self.id           = id
        self.categories   = categories
        self.displayName  = displayName
        self.name         = name
        self.menuBrand    = menuBrand
        self.menus        = menus
        self.brand        = brand
        self.openingTimes = openingTimes
    }
    
    enum CodingKeys: String, CodingKey {
        case numericalId, address, id, categories, displayName, name, menus, brand
        case latitude     = "geoLat"
        case longitude    = "geoLon"
        case openingTimes = "openingTimes.weekday"
        case images       = "image"
        case menuBrand    = "menu"
    }

    
}

