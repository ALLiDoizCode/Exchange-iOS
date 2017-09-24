//
//  MainViewController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/24/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material

class MainViewController: UIViewController {
    var ripplePriceLbl = UILabel()
    var rippleFeeLabel = UILabel()
    var buyBtn = FlatButton()
    var sellBtn = FlatButton()
    var walletView = WalletBalanceView()
    var transactionView = TransactionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Color.grey.lighten5
        self.view.addSubview(ripplePriceLbl)
        self.view.addSubview(rippleFeeLabel)
        self.view.addSubview(buyBtn)
        self.view.addSubview(sellBtn)
        self.view.addSubview(walletView)
        self.view.addSubview(transactionView)
        setupViews()
        constrainViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupViews() {
        
        buyBtn.setTitle("Buy", for: .normal)
        buyBtn.setTitleColor(Color.grey.lighten5, for: .normal)
        buyBtn.titleLabel?.font = RobotoFont.regular(with: 17)
        buyBtn.backgroundColor = Color.blue.accent3
        buyBtn.cornerRadius = 0
        
        sellBtn.setTitle("Sell", for: .normal)
        sellBtn.setTitleColor(Color.blue.accent3, for: .normal)
        sellBtn.titleLabel?.font = RobotoFont.regular(with: 17)
        sellBtn.backgroundColor = Color.grey.lighten5
        //sellBtn.borderWidth = 2
        //sellBtn.borderColor = Color.blue.accent3
        sellBtn.cornerRadius = 0
        
    }

    func constrainViews() {
        
        sellBtn.translatesAutoresizingMaskIntoConstraints = false
        buyBtn.translatesAutoresizingMaskIntoConstraints = false
        walletView.translatesAutoresizingMaskIntoConstraints = false
        
        sellBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        sellBtn.leftAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        sellBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        sellBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        buyBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        buyBtn.rightAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        buyBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        buyBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        walletView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.33).isActive = true
        walletView.bottomAnchor.constraint(equalTo: sellBtn.topAnchor, constant: 0).isActive = true
        walletView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        walletView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
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
