//
//  WithdrawViewController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/28/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material
import SwiftIconFont

class WithdrawViewController: SideViewController {
    var addressField = TextField()
    var withDrawBtn = FlatButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(addressField)
        self.view.addSubview(withDrawBtn)
        setup()
        constrain()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
       
        addressField.font = RobotoFont.bold(with: 14)
        addressField.textAlignment = .center
        addressField.placeholder = "Address"
        addressField.borderStyle = .roundedRect
        addressField.backgroundColor = Color.grey.lighten5
        
        withDrawBtn.setTitle("Withdraw", for: .normal)
        withDrawBtn.backgroundColor = Color.blue.accent3
        
        currentTitle.text = "Withdraw"
        subTitle.text = "Recieveing Address"
    }
    
    func constrain() {
        addressField.translatesAutoresizingMaskIntoConstraints = false
        withDrawBtn.translatesAutoresizingMaskIntoConstraints = false
        
        addressField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        addressField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        addressField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20).isActive = true
        
        withDrawBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        withDrawBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        withDrawBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        withDrawBtn.topAnchor.constraint(equalTo: addressField.bottomAnchor, constant: 20).isActive = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
