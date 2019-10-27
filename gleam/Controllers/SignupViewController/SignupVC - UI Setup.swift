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
        
        selectLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: 30))
        selectLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height/15)
        selectLabel.font = UIFont(name: "AvenirNext-Regular", size: 20)
        selectLabel.textColor = UIColor(hexString: "E6E6DD")
        let text = NSMutableAttributedString(string: "i am select one ")
        text.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 5, length: 10))
        text.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "E6E6DD"), range: NSRange(location: 0, length: text.length))
        let arrow = NSMutableAttributedString(string: "\u{25BE}", attributes: [NSAttributedString.Key.font: UIFont(name: "AvenirNext-Regular", size: 23)!])
        text.append(arrow)
        selectLabel.attributedText = text
        view.addSubview(selectLabel)
        
        photographerButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.5, height: 20))
        photographerButton.center = CGPoint(x: view.frame.width/2 - selectLabel.frame.width/5 + 19, y: selectLabel.frame.maxY + view.frame.height/30)
        photographerButton.backgroundColor = UIColor.clear
        photographerButton.setTitle("a photographer", for: .normal)
        photographerButton.setTitleColor(UIColor(hexString: "E6E6DD"), for: .normal)
        photographerButton.titleLabel!.font = UIFont(name: "AvenirNext-Regular", size: 20)
        photographerButton.addTarget(self, action: #selector(photographerSelected), for: .touchUpInside)
        view.addSubview(photographerButton)

        clientButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.5, height: 20))
        clientButton.center = CGPoint(x: view.frame.width/2 -  selectLabel.frame.width/5 + 19, y: photographerButton.frame.maxY + view.frame.height/30)
        clientButton.backgroundColor = UIColor.clear
        clientButton.setTitle("looking for one", for: .normal)
        clientButton.setTitleColor(UIColor(hexString: "E6E6DD"), for: .normal)
        clientButton.titleLabel!.font = UIFont(name: "AvenirNext-Regular", size: 20)
        clientButton.addTarget(self, action: #selector(clientSelected), for: .touchUpInside)
        view.addSubview(clientButton)
    }
    
    func setUpFields() {
        nameField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        nameField.center = CGPoint(x: view.frame.width/2, y: clientButton.frame.maxY + view.frame.height/15)
        nameField.font = UIFont(name: "AvenirNext-Regular", size: 18)
        nameField.textColor = UIColor(hexString: "E6E6DD")
        nameField.backgroundColor = UIColor.clear
        nameField.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "E6E6DD")])
        nameField.setBottomBorder()
        nameField.autocapitalizationType = .none
        nameField.addTarget(self, action: #selector(nameEntered), for: .allEditingEvents)
        view.addSubview(nameField)
        
        emailField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        emailField.center = CGPoint(x: view.frame.width/2, y: nameField.frame.maxY + view.frame.height/25)
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
        signupButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: 40))
        signupButton.center = CGPoint(x: view.frame.width/2, y: passwordField.frame.maxY + view.frame.height/15)
        signupButton.backgroundColor = UIColor.clear
        signupButton.setTitle("get started", for: .normal)
        signupButton.setTitleColor(UIColor(hexString: "E6E6DD"), for: .normal)
        signupButton.titleLabel!.font = UIFont(name: "AvenirNext-Regular", size: 20)
        signupButton.addTarget(self, action: #selector(signupAttempt), for: .touchUpInside)
        view.addSubview(signupButton)
    }
}

