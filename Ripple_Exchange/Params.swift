//
//  Params.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/23/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation
import Alamofire

class Params {
    
    func newAccount(email:String,first_name:String,last_name:String,card:String,day:String,month:String,year:String,city:String,line1:String,postalCode:String,state:String,personal_Id:String) -> Parameters {
        
        let parameters:Parameters = [
        
            "email":email,
            "first_name":first_name,
            "last_name":last_name,
            "card":card,
            "day":day,
            "month":month,
            "year":year,
            "city":city,
            "line1":line1,
            "postalCode":postalCode,
            "state":state,
            "personal_Id":personal_Id
            
        ]
        
        return parameters
    }
    
    func newCustomer(email:String,token:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "email":email,
            "token":token
            
        ]
        
        return parameters
    }
    
    func createUser(customer:String,connect:String,email:String,password:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "customer":customer,
            "connect":connect,
            "email":email,
            "password":password,
            
        ]
        
        return parameters
    }
    
    func outBound(email:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "email":email,
            
        ]
        
        return parameters
    }
    
    func inBound(email:String,address:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "email":email,
            "address":address
            
            ]
        
        return parameters
    }
    
    func deposit(email:String,password:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "email":email,
            "password":password
            
            ]
        
        return parameters
    }
    
    func signIn(email:String,password:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "email":email,
            "password":password
            
            ]
        
        return parameters
    }
    
    func charge(amount:String,email:String,password:String,rate:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "amount":amount,
            "email":email,
            "password":password,
            "rate":rate
            
            ]
        
        return parameters
    }
    
    func withdrawInBound(email:String,password:String,amount:String,address:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "email":email,
            "password":password,
            "amount":amount,
            "address":address
            
            ]
        
        return parameters
    }
    
    func withdrawOutBound(email:String,password:String,amount:String,address:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "email":email,
            "password":password,
            "amount":amount,
            "address":address
            
            ]
        
        return parameters
    }
    
    func transaction(id:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "id":id
            
        ]
        
        return parameters
    }
    
    func exchangeTransaction(charge_Id:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "charge_Id":charge_Id
            
        ]
        
        return parameters
    }
    
    func accountInfo(email:String,password:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "email":email,
            "password":password
            
        ]
        
        return parameters
    }
    
    func addSource(account:String,external_account:String,default_for_currency:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "account":account,
            "external_account":external_account,
            "default_for_currency":default_for_currency
            
        ]
        
        return parameters
    }
    
    func updateSource(account:String,external_account:String,default_for_currency:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "account":account,
            "external_account":external_account,
            "default_for_currency":default_for_currency
            
        ]
        
        return parameters
    }
    
    func getSource(account:String,sourceId:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "account":account,
            "sourceId":sourceId
            
        ]
        
        return parameters
    }
    
    func deleteSource(account:String,external_account:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "account":account,
            "external_account":external_account
            
        ]
        
        return parameters
    }
    
    func customerCards(customer:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "customer":customer
            
        ]
        
        return parameters
    }
    
    func accountBanks(account:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "account":account,
            
        ]
        
        return parameters
    }
    
    func customerBanks(customer:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "customer":customer,
            
            ]
        
        return parameters
    }
    
    func accountCards(account:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "account":account,
            
            ]
        
        return parameters
    }
    
    func newCard(customer:String,token:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "customer":customer,
            "token":token
            
        ]
        
        return parameters
    }
    
    func payout(sourceType:String,account:String,amount:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "sourceType":sourceType,
            "account":account,
            "amount":amount
            
            ]
        
        return parameters
    }
    
    func instantPayout(account:String,amount:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "account":account,
            "amount":amount
            
        ]
        
        return parameters
    }
    
    func setPayout(account:String,interval:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "account":account,
            "interval":interval
            
        ]
        
        return parameters
    }
    
    func verifyToken(token:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "token":token
            
        ]
        
        return parameters
    }
    
    func exist(email:String) -> Parameters {
        
        let parameters:Parameters = [
            
            "email":email
            
        ]
        
        return parameters
    }
    
}
