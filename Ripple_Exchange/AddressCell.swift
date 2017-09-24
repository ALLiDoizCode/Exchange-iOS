//
//  AddressCell.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/24/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material
class AddressCell: UITableViewCell {
    let balanceLbl = UILabel()
    let balanceTitle = UILabel()
    let USDLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(balanceLbl)
        self.addSubview(balanceTitle)
        self.addSubview(USDLabel)
        setupView()
        constrainView()
        self.backgroundColor = Color.blue.accent2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setupView() {
        balanceLbl.font = RobotoFont.regular(with: 24)
        balanceLbl.textColor = Color.grey.lighten5
        balanceTitle.font = RobotoFont.regular(with: 24)
        balanceTitle.textColor = Color.grey.lighten5
        USDLabel.font = RobotoFont.regular(with: 24)
        USDLabel.textColor = Color.grey.lighten5
    }
    
    func constrainView() {
        balanceLbl.translatesAutoresizingMaskIntoConstraints = false
        balanceTitle.translatesAutoresizingMaskIntoConstraints = false
        USDLabel.translatesAutoresizingMaskIntoConstraints = false
        
        balanceLbl.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        balanceLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        balanceTitle.bottomAnchor.constraint(equalTo: balanceLbl.topAnchor, constant: -5).isActive = true
        balanceTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        USDLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        USDLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: -20).isActive = true
        USDLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0).isActive = true
    }
}
