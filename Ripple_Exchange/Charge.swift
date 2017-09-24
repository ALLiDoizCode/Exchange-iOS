//
//  Charge.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/23/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation

class Charge {
    
    var amount:String!
    var email:String!
    var password:String!
    var rate:String!
    
    init(amount:String,email:String,password:String,rate:String) {
        self.amount = amount
        self.email = email
        self.password = password
        self.rate = rate
    }
}
