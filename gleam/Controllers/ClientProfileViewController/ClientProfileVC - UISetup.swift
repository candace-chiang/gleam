//
//  ClientProfileVC - UISetup.swift
//  gleam
//
//  Created by Mary Xu on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension ClientProfileViewController {
    func setUpBackground() {
        view.backgroundColor = UIColor(hexString: "FFFFFF")
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/8))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height/20 + 50)
        titleLabel.text = "my account"
        titleLabel.font = UIFont(name: "AvenirNext-Regular", size: 30)
        titleLabel.textColor = UIColor(hexString: "232429")
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        profileView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.25, height: view.frame.width * 0.25))
        profileView.center = CGPoint(x: view.frame.width/5, y: titleLabel.frame.maxY + view.frame.height/20)
        profileView.image = UIImage(named: "Icon")
        profileView.contentMode = .scaleAspectFit
        view.addSubview(profileView)
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/20))
        nameLabel.center = CGPoint(x: view.frame.width * 4/5, y: profileView.frame.minY +
            view.frame.height/70)
        nameLabel.text = user?.name
        nameLabel.font = UIFont(name: "AvenirNext-Regular", size: 27)
        nameLabel.textColor = UIColor(hexString: "232429")
        nameLabel.textAlignment = .left
        view.addSubview(nameLabel)
        
        emailLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/20))
        emailLabel.center = CGPoint(x: view.frame.width * 4/5, y: nameLabel.frame.maxY + view.frame.height/90 + 5)
        emailLabel.text = user?.email
        emailLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        emailLabel.textColor = UIColor(hexString: "#232429").withAlphaComponent(0.7)
        emailLabel.textAlignment = .left
        view.addSubview(emailLabel)
        
        contactLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/8))
        contactLabel.center = CGPoint(x: view.frame.width/2, y: profileView.frame.maxY + view.frame.height/20)
        contactLabel.text = "contacted photographers"
        contactLabel.font = UIFont(name: "AvenirNext-Regular", size: 25)
        contactLabel.textColor = UIColor(hexString: "#232429")
        contactLabel.textAlignment = .center
        view.addSubview(contactLabel)
        
        locationField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/20))
        locationField.center = CGPoint(x: view.frame.width * 4/5, y: emailLabel.frame.maxY + view.frame.height/90)
        locationField.font = UIFont(name: "AvenirNext-Regular", size: 25)!
        locationField.textColor = UIColor(hexString: "#232429")
        locationField.textAlignment = .left
        view.addSubview(locationField)
    }
    
    func setUpButtons() {
        logoutButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: 40))
        logoutButton.center = CGPoint(x: view.frame.width/2, y: contactLabel.frame.maxY + view.frame.height/20)
        logoutButton.setTitle("sign out", for: .normal)
        logoutButton.titleLabel!.font = UIFont(name: "AvenirNext-Bold", size: 25)
        logoutButton.setTitleColor(UIColor(hexString: "232429"), for: .normal)
        logoutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        view.addSubview(logoutButton)
    }
}
