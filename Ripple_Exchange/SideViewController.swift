//
//  SideViewController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/26/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material
import SideMenuController

class SideViewController: UIViewController {
    let button = FlatButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        let image = UIImage(named: "menu")
        button.setImage(image, for: UIControlState.normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        button.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1.1).isActive = true
        button.addTarget(self, action: #selector(SideViewController.toggleMenu), for: UIControlEvents.touchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleMenu() {
        sideMenuController?.toggle()
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
