//
//  ExchangeClient.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/23/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ExchangeClient {
    
    static let sharedInstance = ExchangeClient()
    
    func fetch(request:URLRequestConvertible,completion:@escaping (_ json:JSON?,_ error:Error? ) -> Void){
        Alamofire.request(request).responseData { (response) in
            
            guard response.error == nil else {
                completion(nil,response.error!)
                return
            }
            guard let result = response.value else {
                completion(nil,nil)
                return
            }
            
            let json = JSON(data: result)
            completion(json,nil)
        }
    }
    
    func bankToken(client_id:String,secret:String,public_token:String,accountId:String,completion:@escaping (_ Id:String) ->Void){
        
        let headers: HTTPHeaders = [
            
            "Content-Type" : "application/json"
        ]
        
        let parameters = [
            "client_id": client_id,
            "secret": secret,
            "public_token":public_token
        ]
        
        Alamofire.request("https://sandbox.plaid.com/item/public_token/exchange", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
            
            let json = JSON(response.result.value!)
            
            let accessToken = json["access_token"].stringValue
            
            print("response is \(response)")
            print("json is \(json)")
            print("access token is \(accessToken)")
            
            let parameters2 = [
                "client_id": client_id,
                "secret": secret,
                "access_token":accessToken,
                "account_id":accountId
            ]
            
            
            Alamofire.request("https://sandbox.plaid.com/processor/stripe/bank_account_token/create", method: HTTPMethod.post, parameters: parameters2, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { (response) in
                
                let json = JSON(response.result.value!)
                
                let banktoken = json["stripe_bank_account_token"].stringValue
                
                print("response is \(response)")
                print("json is \(json)")
                print("bank token is \(banktoken)")
                
                completion(banktoken)
            })
            
        }
    }
}
