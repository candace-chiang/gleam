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
    
    var usernameField: UITextField!
    var passwordField: UITextField!
    
    var username = ""
    var password = ""
    var email = ""
    
    var loginButton: UIButton!
    var registerLabel: UILabel!
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
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        /*
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "toFeed", sender: self)
        }*/
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        usernameField.text = ""
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
    
    @objc func usernameEntered(_ sender: UITextField) {
        username = sender.text!
    }
    
    @objc func passwordEntered(_ sender: UITextField) {
        password = sender.text!
    }
    
    @objc func loginAttempt(_ sender: UIButton) {
        if username == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your username.")
            return
        } else if password == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your password.")
            return
        } else {
            /*let userRef = Database.database().reference().child("users").child(username)
            userRef.observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                self.email = value?["email"] as? String ?? ""
                self.emailLogin()
            }) { (error) in
                self.displayAlert(title: "Invalid", message: "Couldn't find username.")
            }*/
        }
    }
    
    @objc func signUp(_ sender: UIButton) {
        //performSegue(withIdentifier: "register", sender: self)
    }
    
    func emailLogin() {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil{
                self.displayAlert(title: "Invalid", message: "Couldn't sign in.")
            } else{
                self.performSegue(withIdentifier: "toFeed", sender: self)
            }
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

