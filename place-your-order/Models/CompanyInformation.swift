//
//  CompanyInformation.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class CompanyInformation: Codable, Mappable {
    
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
        self.openingTimes = openingTimes
        self.images       = images
        self.address      = address
        self.id           = id
        self.categories   = categories
        self.displayName  = displayName
        self.name         = name
        self.menuBrand    = menuBrand
        self.menus        = menus
        self.brand        = brand
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        numericalId  <- map["numericalId"]
        latitude     <- map["geoLat"]
        longitude    <- map["geoLon"]
        openingTimes <- map["openingTimes.weekday"]
        images       <- map["image"]
        address      <- map["address"]
        id           <- map["id"]
        categories   <- map["categories"]
        displayName  <- map["displayName"]
        name         <- map["name"]
        menuBrand    <- map["menu"]
        menus        <- map["menus"]
        brand        <- map["brand"]
    }
}

