//
//  User.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/23/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation
import Cely

class User:CelyUser {
    
    var customerId:String!
    var connected_Account_Id:String!
    var token:String!
    var inboundBalance:String = ""
    var outBoundBalance:String = ""
    static var currentUser = User()
    
    enum Property: CelyProperty {
        case token = "token"
    }
    
    init() {
        
    }
    
    init(customerId:String,connected_Account_Id:String,token:String) {
        self.customerId = customerId
        self.connected_Account_Id = connected_Account_Id
        self.token = token
        User.currentUser = self
    }
}
