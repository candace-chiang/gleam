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
    
    var selectLabel: UILabel!
    var photographerButton: UIButton!
    var clientButton: UIButton!
    
    var nameField: UITextField!
    var emailField: UITextField!
    var passwordField: UITextField!
    
    var photographer = false
    var name = ""
    var password = ""
    var email = ""
    
    var optionChosen = false
    
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
    
    @objc func clientSelected(_ sender: UITextField) {
        photographer = false
        optionChosen = true
        photographerButton.layer.shadowOpacity = 0
        photographerButton.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 20)
        clientButton.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 20)
        clientButton.layer.shadowColor = UIColor.white.cgColor
        clientButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        clientButton.layer.shadowRadius = 5
        clientButton.layer.shadowOpacity = 1
    }
    
    @objc func photographerSelected(_ sender: UITextField) {
        photographer = true
        optionChosen = true
        photographerButton.layer.shadowColor = UIColor.white.cgColor
        photographerButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        photographerButton.layer.shadowRadius = 5
        photographerButton.layer.shadowOpacity = 1
        photographerButton.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 20)
        clientButton.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 20)
        clientButton.layer.shadowOpacity = 0.0
    }
    
    @objc func signupAttempt(_ sender: UIButton) {
        if email == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your email.")
            return
        } else if password == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your password.")
            return
        } else if name == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your name.")
            return
        } else if !optionChosen {
            displayAlert(title: "Incomplete", message: "Please select an option above.")
            return
        }
        
       Auth.auth().createUser(withEmail: email, password: password, completion: { (User, error) in
           if error == nil {
               let ref = Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!)
            ref.setValue(["name": self.name, "email": self.email, "photographer": self.photographer, "location": "", "radius": "", "rates": "", "tags": [], "description": "", "links": [], "images": []])
               self.emailField.text = ""
               self.passwordField.text = ""
               self.nameField.text = ""
               self.optionChosen = false
               //self.performSegue(withIdentifier: "toFeed", sender: self)
           }
           else {
               self.displayAlert(title: "Error", message: "Error creating user.")
           }
       })
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


