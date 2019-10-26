//
//  SignupVC - UI Setup.swift
//  gleam
//
//  Created by Carol Wang on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension SignupViewController {
    func setUpBackground() {
        view.backgroundColor = UIColor(hexString: "232429")
    }
    
    func setUpFields() {
        nameField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        nameField.center = CGPoint(x: view.frame.width/2, y: view.frame.height/25)
        nameField.font = UIFont(name: "AvenirNext-Regular", size: 18)
        nameField.textColor = UIColor(hexString: "E6E6DD")
        nameField.backgroundColor = UIColor.clear
        nameField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "E6E6DD")])
        nameField.setBottomBorder()
        nameField.addTarget(self, action: #selector(nameEntered), for: .allEditingEvents)
        view.addSubview(nameField)
        
        emailField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        emailField.center = CGPoint(x: view.frame.width/2, y: nameField.frame.maxY + view.frame.height/25)
        emailField.font = UIFont(name: "AvenirNext-Regular", size: 18)
        emailField.textColor = UIColor(hexString: "E6E6DD")
        emailField.backgroundColor = UIColor.clear
        emailField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "E6E6DD")])
        emailField.setBottomBorder()
        emailField.addTarget(self, action: #selector(emailEntered), for: .allEditingEvents)
        view.addSubview(emailField)
        
        passwordField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        passwordField.center = CGPoint(x: view.frame.width/2, y: emailField.frame.maxY + view.frame.height/20)
        passwordField.backgroundColor = UIColor.clear
        passwordField.font = UIFont(name: "AvenirNext-Regular", size: 18)
        passwordField.textColor = UIColor(hexString: "E6E6DD")
        passwordField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "E6E6DD")])
        passwordField.setBottomBorder()
        passwordField.addTarget(self, action: #selector(passwordEntered), for: .allEditingEvents)
        view.addSubview(passwordField)
    }
    
    func setUpButtons() {
        signupButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: 40))
        signupButton.center = CGPoint(x: view.frame.width/2, y: passwordField.frame.maxY + view.frame.height/15)
        signupButton.backgroundColor = UIColor.clear
        signupButton.setTitle("get started", for: .normal)
        signupButton.setTitleColor(UIColor(hexString: "E6E6DD"), for: .normal)
        signupButton.titleLabel!.font = UIFont(name: "AvenirNext-Regular", size: 18)
        signupButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        view.addSubview(signupButton)
    }
}

