//
//  SignInViewController.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/24/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import UIKit
import Material
import Validator
import SideMenuController

class SignInViewController: UIViewController {
    let logo = UILabel()
    let emailField = TextField()
    let passwordField = TextField()
    let loginButton = FlatButton()
    let signUpButton = FlatButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.grey.lighten5
        self.view.addSubview(logo)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(loginButton)
        self.view.addSubview(signUpButton)
        emailField.text = "user1@user1.com"
        passwordField.text = "123"
        
        setupView()
        costrainView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        logo.text = "Ripple Exchange"
        logo.textColor = Color.blue.accent3
        logo.font = RobotoFont.bold(with: 36)
        logo.textAlignment = .center
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(Color.grey.lighten5, for: .normal)
        loginButton.titleLabel?.font = RobotoFont.regular(with: 17)
        loginButton.backgroundColor = Color.blue.accent3
        loginButton.cornerRadius = 0
        loginButton.addTarget(self, action: #selector(SignInViewController.login), for: UIControlEvents.touchUpInside)
        
        signUpButton.setTitle("SignUp", for: .normal)
        signUpButton.setTitleColor(Color.blue.accent3, for: .normal)
        signUpButton.titleLabel?.font = RobotoFont.regular(with: 17)
        signUpButton.backgroundColor = Color.grey.lighten5
        signUpButton.borderWidth = 2
        signUpButton.borderColor = Color.blue.accent3
        signUpButton.cornerRadius = 0
        
        emailField.placeholder = "Email"
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        
        
    }
    
    func costrainView() {
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

        signUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        signUpButton.leftAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        signUpButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        loginButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        loginButton.rightAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        loginButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        passwordField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        passwordField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        passwordField.heightAnchor.constraint(equalTo: loginButton.heightAnchor, multiplier: 1).isActive = true
        passwordField.bottomAnchor.constraint(equalTo: self.loginButton.topAnchor, constant: -100).isActive = true
        
        emailField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        emailField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        emailField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95).isActive = true
        emailField.heightAnchor.constraint(equalTo: loginButton.heightAnchor, multiplier: 1).isActive = true
        emailField.bottomAnchor.constraint(equalTo: self.passwordField.topAnchor, constant: -10).isActive = true
        
        logo.bottomAnchor.constraint(equalTo: self.emailField.topAnchor, constant: -100).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        logo.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
        logo.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
    }
    
    func login() {
        
        guard passwordField.text != "" else {
            return
        }
        
        let error = ValidationError(message: "invalid email")
        
        let rule = ValidationRulePattern(pattern: EmailValidationPattern.standard, error: error)
        
        let result = emailField.text?.validate(rule: rule)
        // Note: the above is equivalent to Validator.validate(input: "invalid@email,com", rule: rule)
        
        switch result {
        case .valid?:
            Presenter().presentSignIn(email: emailField.text!, password: passwordField.text!, completion: { (error) in
                guard error == nil else {
                    return
                }
                
                print("email is \(User.currentUser.email)")
                
                Presenter().presentAccountInfo(email: User.currentUser.email, password: User.currentUser.password, completion: { (success, infoError) in
                    print("success is \(success)")
                    guard success == true else {
                        return
                    }
                    
                    let controller = MainViewController()
                    self.sideMenuController?.embed(centerViewController: controller, cacheIdentifier: "dashboard")
                    //self.navigationController?.pushViewController(controller, animated: true)
                })
            })
        case .invalid( _)?:
            print("invalid email")
        case .none:
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
