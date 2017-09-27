//
//  MenuViewController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/26/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import SideMenuController
import Material

class MenuViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {

        let sideMenuViewController = SideMenuController()
        
        // create the view controllers for center containment
        let vc1 = SignInViewController()
        let nc1 = UINavigationController(rootViewController: vc1)
        
        // create the side controller
        let sideController = UITableViewController()
        
        // embed the side and center controllers
        sideMenuViewController.embed(sideViewController: sideController)
        sideMenuViewController.embed(centerViewController: vc1)
        
        // add the menu button to each view controller embedded in the tab bar controller
        nc1.addSideMenuButton()
        
        show(sideMenuViewController, sender: nil)
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
