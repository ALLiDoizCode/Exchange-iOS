//
//  WalletBalanceView.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/24/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material

class WalletBalanceView: UIView,UITableViewDataSource,UITableViewDelegate {

    var tableView:UITableView!
    //var addressData:[(balance:String,title:String)] = []
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("constructed view")
        tableView = UITableView()
        tableView.register(AddressCell.self, forCellReuseIdentifier: "address")
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = Color.blue.accent2
        self.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.height/2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "address") as! AddressCell
        
        if indexPath.row == 0 {
            cell.balanceTitle.text = "Inbound"
            if Int(User.currentUser.inboundBalance) == nil {
                cell.balanceLbl.text = "0 XRP"
            }else {
                let ripple = Double(User.currentUser.inboundBalance)
                cell.balanceLbl.text = "\(ripple!/1000000) XRP"
            }
        }else {
            cell.balanceTitle.text = "Outbound"
            if Int(User.currentUser.outBoundBalance) == nil {
                cell.balanceLbl.text = "0 XRP"
            }else {
                let ripple = Double(User.currentUser.outBoundBalance)
                cell.balanceLbl.text = "\(ripple!/1000000) XRP"
            }
        }
        return cell
    }

}
