//
//  ExchangeTranscation.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/23/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation

class ExchangeTranscation {
    
    var chargeId:String!
    var created:String!
    var ripplePrice:String!
    var rippleAmount:String!
    var fiatAmount:String!
    var providerFee:String!
    var networkFee:String!
    var transactionId:String!
    var status:String!
    
    init(chargeId:String,created:String,ripplePrice:String,rippleAmount:String,fiatAmount:String,providerFee:String,networkFee:String,transactionId:String,status:String) {
        
        self.chargeId = chargeId
        self.created = created
        self.ripplePrice = ripplePrice
        self.rippleAmount = rippleAmount
        self.fiatAmount = fiatAmount
        self.providerFee = providerFee
        self.networkFee = networkFee
        self.transactionId = transactionId
        self.status = status
    }
}
