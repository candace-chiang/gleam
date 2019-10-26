//
//  SignupViewController.swift
//  gleam
//
//  Created by Carol Wang on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    var nameField: UITextField!
    var emailField: UITextField!
    var passwordField: UITextField!
    
    var role = ""
    var name = ""
    var password = ""
    var email = ""
    
    var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpFields()
        setUpButtons()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController!.isNavigationBarHidden = true
        self.nameField.delegate = self
        self.emailField.delegate = self
        self.passwordField.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        nameField.text = ""
        emailField.text = ""
        passwordField.text = ""
    }
    
    //dismiss keyboard when you press somewhere else
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //dismiss keyboard when you press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func nameEntered(_ sender: UITextField) {
        name = sender.text!
    }
    
    @objc func emailEntered(_ sender: UITextField) {
        email = sender.text!
    }
    
    @objc func passwordEntered(_ sender: UITextField) {
        password = sender.text!
    }
    
    @objc func loginAttempt(_ sender: UIButton) {
        if email == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your username.")
            return
        } else if password == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your password.")
            return
        } else if name == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your name.")
            return
        }
    }
    
    @objc func signUp(_ sender: UIButton) {
        performSegue(withIdentifier: "toFeed", sender: self)
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


