//
//  LoginVC - UISetup.swift
//  gleam
//
//  Created by Candace Chiang on 10/25/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension LoginViewController {
    func setUpBackground() {
        view.backgroundColor = UIColor(hexString: "232429")
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.4, height: view.frame.width * 0.4))
        imageView.center = CGPoint(x: view.frame.width/2, y: view.frame.height/4)
        imageView.image = UIImage(named: "Icon")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/8))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: imageView.frame.maxY + view.frame.height/30)
        titleLabel.text = "gleam"
        titleLabel.font = UIFont(name: "AvenirNext-Regular", size: 45)
        titleLabel.textColor = UIColor(hexString: "E6E6DD")
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
    }
    
    func setUpFields() {
        emailField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        emailField.center = CGPoint(x: view.frame.width/2, y: titleLabel.frame.maxY + view.frame.height/20)
        emailField.font = UIFont(name: "AvenirNext-Regular", size: 18)
        emailField.textColor = UIColor(hexString: "E6E6DD")
        emailField.backgroundColor = UIColor.clear
        emailField.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "E6E6DD")])
        emailField.setBottomBorder()
        emailField.autocapitalizationType = .none
        emailField.addTarget(self, action: #selector(emailEntered), for: .allEditingEvents)
        view.addSubview(emailField)
        
        passwordField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        passwordField.center = CGPoint(x: view.frame.width/2, y: emailField.frame.maxY + view.frame.height/20)
        passwordField.backgroundColor = UIColor.clear
        passwordField.font = UIFont(name: "AvenirNext-Regular", size: 18)
        passwordField.textColor = UIColor(hexString: "E6E6DD")
        passwordField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "E6E6DD")])
        passwordField.setBottomBorder()
        passwordField.isSecureTextEntry = true
        passwordField.autocapitalizationType = .none
        passwordField.addTarget(self, action: #selector(passwordEntered), for: .allEditingEvents)
        view.addSubview(passwordField)
    }
    
    func setUpButtons() {
        loginButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/3, height: 40))
        loginButton.center = CGPoint(x: view.frame.width/2, y: passwordField.frame.maxY + view.frame.height/15)
        loginButton.backgroundColor = UIColor.clear
        loginButton.setTitle("sign in", for: .normal)
        loginButton.setTitleColor(UIColor(hexString: "E6E6DD"), for: .normal)
        loginButton.titleLabel!.font = UIFont(name: "AvenirNext-Regular", size: 20)
        loginButton.addTarget(self, action: #selector(loginAttempt), for: .touchUpInside)
        view.addSubview(loginButton)
        
        registerButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: 40))
        registerButton.center = CGPoint(x: view.frame.width/2, y: loginButton.frame.maxY + view.frame.height/25)
        registerButton.backgroundColor = UIColor.clear
        registerButton.setTitle("new? create an account", for: .normal)
        registerButton.setTitleColor(UIColor(hexString: "E6E6DD"), for: .normal)
        registerButton.titleLabel!.font = UIFont(name: "AvenirNext-Bold", size: 18)
        registerButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        view.addSubview(registerButton)
    }
}

extension UITextField { //for bottom text line: from stack overflow #26800963
    func setBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor(hexString: "E6E6DD").cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
