//
//  User.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/23/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation

class User {
    
    var customerId:String!
    var connected_Account_Id:String!
    var inboundBalance:String = ""
    var outBoundBalance:String = ""
    var email:String!
    var password:String!
    static var currentUser = User()
    
    init() {
        
    }
    
    init(customerId:String,connected_Account_Id:String,token:String) {
        self.customerId = customerId
        self.connected_Account_Id = connected_Account_Id
        User.currentUser = self
    }
}
