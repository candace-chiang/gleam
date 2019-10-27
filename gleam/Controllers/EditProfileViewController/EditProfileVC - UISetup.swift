//
//  EditProfileVC - UISetup.swift
//  gleam
//
//  Created by Candace Chiang on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension EditProfileViewController {
    func setUpTitle() {
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/15))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height/30)
        titleLabel.font = UIFont(name: "AvenirNext-Bold", size: 15)
        titleLabel.text = "edit profile"
        view.addSubview(titleLabel)
    }
    
    func setUpImages() {
        
    }
    
    func setUpInfo() {
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.height/15))
        nameLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
        nameLabel.font = UIFont(name: "AvenirNext-Bold", size: 15)
        nameLabel.text = self.user.name
        view.addSubview(nameLabel)
    }
    
    func setUpDesc() {
        
    }
}
