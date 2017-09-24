//
//  ViewController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/22/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*ExchangeClient.sharedInstance.bankToken(client_id: "587bacb94e95b878b0c3bcac", secret: "2edaf82d754e27941d9feacfe08849", public_token: "public-sandbox-8eaf401b-073d-46c0-ad27-c4cfcaaf0244", accountId: "GMmkaXGxqGtNLQD9MRbZCVxEZdVWR8injQWyN") { (id) in
            
            print("bank token is \(id)")
        }*/
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        //let controller = CardViewController()
        //self.present(controller, animated: true, completion: nil)
    }
}

