//
//  Errors.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/24/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation

struct ValidationError: Error {
    
    public let message: String
    
    public init(message m: String) {
        message = m
    }
}
