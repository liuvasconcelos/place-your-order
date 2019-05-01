//
//  ApiMocks.swift
//  place-your-orderTests
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

struct ApiMocks {
    
    public static let companyJson: [String: Any] = {
        let openingTime = ["timeFrom": "12:00",
                           "day": 0,
                           "timeTo": "21:45"] as [String: Any]
        let openingTimesJson = ["calendar": [],
                                "exception": [],
                                "weekday": [openingTime]] as [String: Any]
        
        let image = ["url": "http://images.onyo.com/gslf0GqXbxjX4hlO6ej89XjaRFU=/0x0:240x240/fit-in/240x240/https://onyo.s3.amazonaws.com/picture/47e8ca113f4d4331adcb2a4e4dd2f358.jpg",
                     "width": 240,
                     "repeatable": false,
                     "context": "company-thumbnail-small",
                     "height": 240] as [String: Any]
        let imageJson = [image]
        
        let category = ["numericalId": 286,
                        "name": "Boats e Combinados_old",
                        "parent": "",
                        "brand": "https://api.staging.onyo.com/v1/mobile/brand/29",
                        "id": "https://api.staging.onyo.com/v1/mobile/category/286",
                        "image": "",
                        "order": 21] as [String: Any]
        let categoriesJson = [category]
        
        let menu = ["numericalId": 30,
                    "id": "https://api.staging.onyo.com/v1/mobile/menu/30",
                    "categories": [
                        "https://api.staging.onyo.com/v1/mobile/category/286",
                        "https://api.staging.onyo.com/v1/mobile/category/295",
                        "https://api.staging.onyo.com/v1/mobile/category/280"]] as [String: Any]
        let menusJson = [menu]
        
        let validJson = ["numericalId": 121,
                         "geoLat": "-23.5953990000",
                         "openingTimes": openingTimesJson,
                         "image": imageJson,
                         "address": "R. Olimpíadas, 360 Praça de Alimentação - São Paulo, SP - 04551000",
                         "id": "https://api.staging.onyo.com/v1/mobile/company/121",
                         "categories": categoriesJson,
                         "displayName": "Shopping Vila Olímpia",
                         "name": "Gendai Vila Olímpia",
                         "menu": "https://api.staging.onyo.com/v1/mobile/brand/29",
                         "menus": menusJson,
                         "geoLon": "-46.6866780000",
                         "brand": "https://api.staging.onyo.com/v1/mobile/brand/29"] as [String: Any]
        return validJson
    }()
}
