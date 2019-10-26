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
        view.backgroundColor = UIColor(hexString: "#2ECCFA")
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3))
        imageView.center = CGPoint(x: view.frame.width/2, y: view.frame.height/4)
        imageView.image = UIImage(named: "bearr")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/8))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: imageView.frame.maxY + view.frame.height/16)
        titleLabel.text = "gleam"
        titleLabel.font = UIFont(name: "SourceSansPro-Bold", size: 45)
        titleLabel.textColor = UIColor(hexString: "#F4F12B")
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
    }
    
    func setUpFields() {
        usernameField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        usernameField.center = CGPoint(x: view.frame.width/2, y: titleLabel.frame.maxY + view.frame.height/25)
        usernameField.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect
        usernameField.layer.cornerRadius = 5.0
        usernameField.addTarget(self, action: #selector(usernameEntered), for: .allEditingEvents)
        view.addSubview(usernameField)
        
        passwordField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        passwordField.center = CGPoint(x: view.frame.width/2, y: usernameField.frame.maxY + view.frame.height/20)
        passwordField.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.layer.cornerRadius = 5.0
        passwordField.addTarget(self, action: #selector(passwordEntered), for: .allEditingEvents)
        view.addSubview(passwordField)
    }
    
    func setUpButtons() {
        loginButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/3, height: view.frame.height/18))
        loginButton.center = CGPoint(x: view.frame.width/2, y: passwordField.frame.maxY + view.frame.height/15)
        loginButton.backgroundColor = UIColor(hexString: "#0174DF")
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        //loginButton.titleLabel!.font = UIFont(name: "RifficFree-Bold", size: 20)
        loginButton.layer.borderColor = UIColor(hexString: "#00BFF").cgColor
        loginButton.layer.cornerRadius = 5.0
        loginButton.addTarget(self, action: #selector(loginAttempt), for: .touchUpInside)
        view.addSubview(loginButton)
        
        registerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.43, height: view.frame.height/20))
        registerLabel.center = CGPoint(x: view.frame.width * 0.4, y: loginButton.frame.maxY + view.frame.height/10)
        registerLabel.text = "Don't have an account?"
        registerLabel.font = UIFont(name: "SourceSansPro-Regular", size: 18)
        registerLabel.textColor = .white
        view.addSubview(registerLabel)
        
        registerButton = UIButton(frame: CGRect(x: registerLabel.frame.maxX, y: registerLabel.frame.minY, width: view.frame.width/4, height: registerLabel.frame.height))
        registerButton.backgroundColor = UIColor(hexString:"#2ECCFA")
        registerButton.setTitle("Sign up!", for: .normal)
        registerButton.setTitleColor(UIColor(hexString: "#F4F12B"), for: .normal)
        registerButton.titleLabel!.font = UIFont(name: "SourceSansPro-Bold", size: 20)
        registerButton.layer.borderColor = UIColor(hexString: "#2ECCFA").cgColor
        registerButton.layer.cornerRadius = 5.0
        registerButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        view.addSubview(registerButton)
    }
}
