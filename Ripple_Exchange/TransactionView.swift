//
//  TransactionView.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/24/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material

class TransactionView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView(frame:self.frame, style: .grouped)
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "tx")
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        self.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tx") as! TransactionCell
        return cell
    }
}
