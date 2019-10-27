//
//  ClientProfileViewController.swift
//  gleam
//
//  Created by Mary Xu on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import QuartzCore
import GooglePlaces
import GooglePlacesRow


class ClientProfileViewController: UIViewController {

    var user: User!
    
    var profileView: UIImageView!
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    
    var locationField: UITextField!
    
    var contactLabel: UILabel!
    var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackground()
        setUpButtons()
        
        let imageLayer: CALayer? = profileView.layer
        imageLayer?.cornerRadius = profileView.frame.size.width/2
        imageLayer?.borderWidth = 0.5
        imageLayer?.masksToBounds = true
    }
    
    @objc func logOut(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        performSegue(withIdentifier: "clientLogout", sender: nil)
    }
}
