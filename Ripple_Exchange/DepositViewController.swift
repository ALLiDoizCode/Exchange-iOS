//
//  DepositViewController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/28/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material

class DepositViewController: SideViewController {
    var label = UILabel()
    var copyBtn = FlatButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(label)
        self.view.addSubview(copyBtn)
        setup()
        constrain()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        label.textColor = Color.grey.lighten5
        label.font = RobotoFont.bold(with: 16)
        label.textAlignment = .center
        label.text = "rKTZNXALMGFHPM3GoxqS2MZ9P8dGA5yoVg"
        copyBtn.setTitle("Copy", for: .normal)
        copyBtn.backgroundColor = Color.blue.accent3
        
        currentTitle.text = "Deposit"
        subTitle.text = "Recieveing Address"
    }
    
    func constrain() {
        label.translatesAutoresizingMaskIntoConstraints = false
        copyBtn.translatesAutoresizingMaskIntoConstraints = false
        
        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20).isActive = true
        
        copyBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        copyBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        copyBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        copyBtn.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
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
