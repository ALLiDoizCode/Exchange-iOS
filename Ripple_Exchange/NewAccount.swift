//
//  NewAccount.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/23/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation

class NewAccount {
    
    var email:String!
    var first_name:String!
    var last_name:String!
    var card:String!
    var day:String!
    var month:String!
    var year:String!
    var city:String!
    var line1:String!
    var postalCode:String!
    var state:String!
    var personal_Id:String!
    
    init(email:String,first_name:String,last_name:String,card:String,day:String,month:String,year:String,city:String,line1:String,postalCode:String,state:String,personal_Id:String) {
        
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
        self.card = card
        self.day = day
        self.month = month
        self.year = year
        self.line1 = line1
        self.postalCode = postalCode
        self.state = state
        self.personal_Id = personal_Id
    }
}
