//
//  RemoteUtils.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

public struct RemoteUtils {
    
    public static let companyPath = "/v1/mobile/company/"
    public static func productsPath(companyId: Int) -> String {
      return "/v2/mobile/company/\(companyId)/products"
    }
    
    public static func buildUrl(_ path: String) -> String {
        return "https://api.staging.onyo.com\(path)"
    }

}

