//
//  MenuTableViewCell.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/27/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material
import SwiftIconFont

class MenuTableViewCell: UITableViewCell {
    var labelIcon = UILabel()
    var label = UILabel()
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
        self.addSubview(labelIcon)
        self.addSubview(label)
        setupView()
        constrainView()
        self.backgroundColor = Color.blue.accent3
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setupView() {
        labelIcon.textColor = Color.blue.lighten5
        labelIcon.font = UIFont.icon(from: .MaterialIcon, ofSize: 30.0)
        label.textColor = Color.grey.lighten5
        label.font = RobotoFont.bold(with: 20)
    }
    
    func constrainView() {
        label.translatesAutoresizingMaskIntoConstraints = false
        labelIcon.translatesAutoresizingMaskIntoConstraints = false
        
        labelIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        labelIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        //label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        label.leadingAnchor.constraint(equalTo: labelIcon.trailingAnchor, constant: 20).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        //labelIcon.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
    }

}

