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
    
    func fetch(request:URLConvertible,completion:@escaping (_ json:JSON?,_ error:Error? ) -> Void){
        Alamofire.request(request).responseData { (response) in
            
            guard response.error == nil else {
                completion(nil,response.error!)
                return
            }
            guard let result = response.value else {
                return
            }
            
            let json = JSON(data: result)
            completion(json,response.error!)
        }
    }
}
