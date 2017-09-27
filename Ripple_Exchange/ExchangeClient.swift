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
    
    func rippleChart(completion:@escaping (_ charts:[RippleChart]) -> Void) {
        
        let headers: HTTPHeaders = [
            
            "Content-Type" : "application/json"
        ]
        var charts:[RippleChart] = []
        let now = Date().timeIntervalSince1970
        let lastMonth = Date().prevWeek(at: .start).timeIntervalSince1970
        print("lastMonth \(lastMonth)")
        print("now \(now)")
        Alamofire.request("https://poloniex.com/public?command=returnTradeHistory&currencyPair=BTC_NXT&start=\(lastMonth)&end=\(now)", method: HTTPMethod.get, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { (response) in
            guard response.error == nil else {
                print("error \(response.error)")
                return
            }
            let json = JSON(response.result.value!)
            print("got \(json.arrayValue.count) chart points")
            for object in json.arrayValue {
                let ISO8601 = object["date"].stringValue
                let rate = object["amount"].doubleValue
                let type = object["type"].string
                
                if type == "sell" {
                    let chart = RippleChart(date: ISO8601, rate: rate)
                    charts.append(chart)
                }
                
            }
            
            completion(charts)
        })
    }
}
