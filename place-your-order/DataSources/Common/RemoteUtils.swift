//
//  RemoteUtils.swift
//  place-your-order
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation

public class RemoteUtils{
    
    public static func buildUrl(_ path: String) -> String {
        return "https://api.staging.onyo.com\(path)"
    }

}

