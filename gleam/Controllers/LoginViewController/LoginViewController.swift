//
//  LoginViewController.swift
//  gleam
//
//  Created by Candace Chiang on 10/25/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    
    var emailField: UITextField!
    var passwordField: UITextField!
    
    var password = ""
    var email = ""
    
    var loginButton: UIButton!
    var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpFields()
        setUpButtons()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController!.isNavigationBarHidden = true
        self.emailField.delegate = self
        self.passwordField.delegate = self
        /*
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "toFeed", sender: self)
        }*/
    }
    
    override func viewDidDisappear(_ animated: Bool) {
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
    
    @objc func emailEntered(_ sender: UITextField) {
        email = sender.text!
    }
    
    @objc func passwordEntered(_ sender: UITextField) {
        password = sender.text!
    }
    
    @objc func loginAttempt(_ sender: UIButton) {
        if email == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your email.")
            return
        } else if password == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your password.")
            return
        } else {
            emailLogin()
        }
    }
    
    @objc func signUp(_ sender: UIButton) {
        performSegue(withIdentifier: "register", sender: self)
    }
    
    func emailLogin() {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil{
                self.displayAlert(title: "Invalid", message: "Couldn't sign in.")
            } else{
                let userRef = Database.database().reference().child("Users").child(self.email)
                userRef.observeSingleEvent(of: .value, with: { (snapshot) in
                    let value = snapshot.value as? NSDictionary
                    self.email = value?["email"] as? String ?? ""
                    self.performSegue(withIdentifier: "toFeed", sender: self)
                }) { (error) in
                    self.displayAlert(title: "Invalid", message: "Couldn't find username.")
                }
            }
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

