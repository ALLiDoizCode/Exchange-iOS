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
    let currentTitle = UILabel()
    let subTitle = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.blue.accent2
        self.view.addSubview(button)
        self.view.addSubview(currentTitle)
        self.view.addSubview(subTitle)
        setupViews()
        constrainViews() 
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleMenu() {
        sideMenuController?.toggle()
    }
    
    func setupViews() {
        let image = UIImage(named: "menu")
        button.setImage(image, for: UIControlState.normal)
        currentTitle.font = RobotoFont.bold(with: 24)
        currentTitle.textColor = Color.grey.lighten5
        currentTitle.textAlignment = .center
        
        subTitle.font = RobotoFont.regular(with: 17)
        subTitle.textColor = Color.grey.lighten5
        subTitle.textAlignment = .center
    }
    
    func constrainViews() {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        currentTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        button.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1.1).isActive = true
        button.addTarget(self, action: #selector(SideViewController.toggleMenu), for: UIControlEvents.touchUpInside)
        
        currentTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        currentTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        currentTitle.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 0).isActive = true
        currentTitle.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        
        subTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        subTitle.topAnchor.constraint(equalTo: currentTitle.bottomAnchor, constant: 0).isActive = true
        //subTitle.bottomAnchor.constraint(equalTo: graphView.topAnchor, constant: 0).isActive = true
        subTitle.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
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
