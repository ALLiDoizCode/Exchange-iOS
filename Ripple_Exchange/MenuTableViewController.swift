//
//  MenuTableViewController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/27/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material

class MenuTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    let menuItems:[(String,String)] = [("ma:assessment","Dashboard"),("ma:account.balance.wallet","Deposit"),("ma:account.balance.wallet","Withdraw"),("ma:account.box","Logout")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "menu")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.backgroundColor = Color.blue.accent3
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu") as! MenuTableViewCell
        cell.labelIcon.text = menuItems[indexPath.row].0
        cell.labelIcon.parseIcon()
        cell.label.text = menuItems[indexPath.row].1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let controller = sideMenuController?.viewController(forCacheIdentifier: "dashboard")
            guard sideMenuController?.centerViewController != controller else {
                break
            }
            sideMenuController?.embed(centerViewController: controller!)
        case 1:
           //depost
            let controller = sideMenuController?.viewController(forCacheIdentifier: "deposit")
            guard controller != nil else {
                let controller = DepositViewController()
                self.sideMenuController?.embed(centerViewController: controller, cacheIdentifier: "deposit")
                return
            }
            guard sideMenuController?.centerViewController != controller else {
                break
            }
            sideMenuController?.embed(centerViewController: controller!)
        case 2:
            //withdraw
            let controller = sideMenuController?.viewController(forCacheIdentifier: "withdraw")
            guard controller != nil else {
                let controller = WithdrawViewController()
                self.sideMenuController?.embed(centerViewController: controller, cacheIdentifier: "withdraw")
                return
            }
            guard sideMenuController?.centerViewController != controller else {
                break
            }
            sideMenuController?.embed(centerViewController: controller!)
        case 3:
            let controller = SignInViewController()
            sideMenuController?.embed(centerViewController:controller)
        default:
            break
        }
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
