//
//  Presenter.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/23/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation
import SwiftyJSON

class Presenter {
    
    let client = ExchangeClient.sharedInstance
    
    func presentSignIn(email:String,password:String){
        
        let params = Params().signIn(email: email, password: password)
        
        client.fetch(request: Router.signIn(parameters: params)) { (json, error) in
            
            guard error == nil else {
                return
            }
        }
    }
    
    func presentCreateUser(customer:String,connect:String,email:String,password:String){
        
        let params = Params().createUser(customer: customer, connect: connect, email: email, password: password)
        
        client.fetch(request: Router.createUser(parameters: params)) { (json, error) in
            
            guard error == nil else {
                return
            }
        }
    }
    
    func presentNewAccount(email:String,first_name:String,last_name:String,card:String,day:String,month:String,year:String,city:String,line1:String,postalCode:String,state:String,personal_Id:String) {
        
        let params = Params().newAccount(email: email, first_name: first_name, last_name: last_name, card: card, day: day, month: month, year: year, city: city, line1: line1, postalCode: postalCode, state: state, personal_Id: personal_Id)
        
        client.fetch(request: Router.newAccount(parameters: params)) { (json, error) in
            
            guard error == nil else {
                return
            }
        }
        
    }
    
    func presentNewCustomer(email:String,token:String) {
        let params = Params().newCustomer(email: email, token: token)
        
        client.fetch(request: Router.createCustomer(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentOutBound(email:String) {
        let params = Params().outBound(email: email)
        client.fetch(request: Router.createOutBound(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentInbound(email:String,address:String) {
        let params = Params().inBound(email: email, address: address)
        client.fetch(request: Router.addInbound(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentDeposit(email:String,password:String) {
        let params = Params().deposit(email: email, password: password)
        client.fetch(request: Router.deposit(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentCharge(amount:String,email:String,password:String,rate:String) {
        let params = Params().charge(amount: amount, email: email, password: password, rate: rate)
        client.fetch(request: Router.charge(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentWithdrawInBound(email:String,password:String,amount:String,address:String) {
        let params = Params().withdrawInBound(email: email, password: password, amount: amount, address: address)
        client.fetch(request: Router.withdrawInbound(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentWithdrawOutBound(email:String,password:String,amount:String,address:String) {
        let params = Params().withdrawOutBound(email: email, password: password, amount: amount, address: address)
        client.fetch(request: Router.withdrawOutbound(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentTranscation(id:String){
        let params = Params().transaction(id: id)
        client.fetch(request: Router.transaction(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentExchangeTransaction(charge_Id:String){
        let params = Params().exchangeTransaction(charge_Id: charge_Id)
        client.fetch(request: Router.exchangeTransaction(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentAccountInfo(email:String,password:String) {
        let params = Params().accountInfo(email: email, password: password)
        client.fetch(request: Router.accountInfo(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentAddSource(account:String,external_account:String,default_for_currency:String) {
        let params = Params().addSource(account: account, external_account: external_account, default_for_currency: default_for_currency)
        client.fetch(request: Router.addSource(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    func presentUpdateSource(account:String,external_account:String,default_for_currency:String) {
        let params = Params().updateSource(account: account, external_account: external_account, default_for_currency: default_for_currency)
        client.fetch(request: Router.updateSource(parameters: params)) { (json, error) in
            guard error == nil else {
                return
            }
        }
    }
    
    
    
    
    
    
    
    
    
}
