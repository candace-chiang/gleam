//
//  EditProfileVC - UISetup.swift
//  gleam
//
//  Created by Candace Chiang on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import TagListView

extension EditProfileViewController {
    func setUpTitle() {
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.height/8))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height/10)
        titleLabel.font = UIFont(name: "AvenirNext-Regular", size: 27)
        titleLabel.text = "edit profile"
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
    }
    
    func setUpImages() {
        let side = view.frame.width * 0.24
        let margin = view.frame.width * 0.014
        image1 = UIButton(frame: CGRect(x: view.frame.width * 0.5 - margin - side, y: titleLabel.frame.maxY, width: side, height: side))
        image2 = UIButton(frame: CGRect(x: view.frame.width * 0.5 + margin, y: titleLabel.frame.maxY, width: side, height: side))
        image3 = UIButton(frame: CGRect(x: view.frame.width * 0.5 - margin - side, y: image1.frame.maxY + margin * 2, width: side, height: side))
        image4 = UIButton(frame: CGRect(x: view.frame.width * 0.5 + margin, y: image1.frame.maxY + margin * 2, width: side, height: side))
        
        image1.setImage(UIImage(named: "add"), for: .normal)
        image2.setImage(UIImage(named: "add"), for: .normal)
        image3.setImage(UIImage(named: "add"), for: .normal)
        image4.setImage(UIImage(named: "add"), for: .normal)
        
        image1.imageView?.contentMode = .scaleAspectFit
        image2.imageView?.contentMode = .scaleAspectFit
        image3.imageView?.contentMode = .scaleAspectFit
        image4.imageView?.contentMode = .scaleAspectFit
        
        image1.addTarget(self, action: #selector(openImageOptions), for: .touchUpInside)
        image2.addTarget(self, action: #selector(openImageOptions), for: .touchUpInside)
        image3.addTarget(self, action: #selector(openImageOptions), for: .touchUpInside)
        image4.addTarget(self, action: #selector(openImageOptions), for: .touchUpInside)
        
        view.addSubview(image1)
        view.addSubview(image2)
        view.addSubview(image3)
        view.addSubview(image4)
    }
    
    func setUpInfo() {
        profileButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.3, height: view.frame.width * 0.3))
        profileButton.center = CGPoint(x: view.frame.width * 0.21, y: view.frame.height * 0.52)
        profileButton.setImage(UIImage(named: "circle"), for: .normal)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.imageView?.setRounded()
        profileButton.addTarget(self, action: #selector(openImageOptions), for: .touchUpInside)
        view.addSubview(profileButton)
        
        let start = view.frame.width * 0.4
        nameLabel = UILabel(frame: CGRect(x: start, y: profileButton.frame.minY - view.frame.height/35, width: view.frame.width * 0.4, height: view.frame.height/17))
        nameLabel.font = UIFont(name: "AvenirNext-Regular", size: 30)
        nameLabel.text = self.user.name
        nameLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(nameLabel)
        
        let iconSize = view.frame.width/15
        let fieldHeight = view.frame.width/13
        let fieldWidth = view.frame.width * 0.4
        let margin = view.frame.width/30
        let spacing = view.frame.width/50
        
        locationImage = UIImageView(frame: CGRect(x: start, y: nameLabel.frame.maxY, width: iconSize, height: iconSize))
        locationImage.image = UIImage(named: "place")
        locationImage.contentMode = .scaleAspectFit
        view.addSubview(locationImage)
        
        locationField = UITextField(frame: CGRect(x: locationImage.frame.maxX + margin, y: 0, width: fieldWidth, height: fieldHeight))
        locationField.center.y = locationImage.frame.midY
        locationField.font = UIFont(name: "AvenirNext-Regular", size: 16)
        locationField.textColor = UIColor(hexString: "232429")
        locationField.backgroundColor = UIColor.clear
        locationField.attributedPlaceholder = NSAttributedString(string: "city, state, country", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "232429")])
        locationField.setBottomBorder()
        locationField.autocapitalizationType = .none
        locationField.addTarget(self, action: #selector(locationEntered), for: .allEditingEvents)
        view.addSubview(locationField)
        
        travelImage = UIImageView(frame: CGRect(x: start, y: locationField.frame.maxY + spacing, width: iconSize, height: iconSize))
        travelImage.image = UIImage(named: "car")
        travelImage.contentMode = .scaleAspectFit
        view.addSubview(travelImage)
        
        travelField = UITextField(frame: CGRect(x: travelImage.frame.maxX + margin, y: 0, width: fieldWidth, height: fieldHeight))
        travelField.center.y = travelImage.frame.midY
        travelField.font = UIFont(name: "AvenirNext-Regular", size: 16)
        travelField.textColor = UIColor(hexString: "232429")
        travelField.backgroundColor = UIColor.clear
        travelField.attributedPlaceholder = NSAttributedString(string: "travel radius", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "232429")])
        travelField.setBottomBorder()
        travelField.autocapitalizationType = .none
        travelField.addTarget(self, action: #selector(travelEntered), for: .allEditingEvents)
        view.addSubview(travelField)
        
        priceImage = UIImageView(frame: CGRect(x: start, y: travelField.frame.maxY + spacing, width: iconSize, height: iconSize))
        priceImage.image = UIImage(named: "cash")
        priceImage.contentMode = .scaleAspectFit
        view.addSubview(priceImage)
        
        priceField = UITextField(frame: CGRect(x: priceImage.frame.maxX + margin, y: 0, width: fieldWidth, height: fieldHeight))
        priceField.center.y = priceImage.frame.midY
        priceField.font = UIFont(name: "AvenirNext-Regular", size: 16)
        priceField.textColor = UIColor(hexString: "232429")
        priceField.backgroundColor = UIColor.clear
        priceField.attributedPlaceholder = NSAttributedString(string: "rate per hour", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "232429")])
        priceField.setBottomBorder()
        priceField.autocapitalizationType = .none
        priceField.addTarget(self, action: #selector(priceEntered), for: .allEditingEvents)
        view.addSubview(priceField)
    }
    
    func setUpTags() {
        tagsLabel = UILabel(frame: CGRect(x: profileButton.frame.minX, y: priceField.frame.maxY + view.frame.height/50, width: view.frame.width, height: view.frame.height/25))
        tagsLabel.font = UIFont(name: "AvenirNext-Regular", size: 20)
        tagsLabel.text = "i specialize in..."
        view.addSubview(tagsLabel)
        
        tags = TagListView(frame: CGRect(x: tagsLabel.frame.minX, y: tagsLabel.frame.maxY + view.frame.height/80, width: view.frame.width * 0.9, height: view.frame.height/10))
        tags.textFont = UIFont(name: "AvenirNext-Regular", size: 16)!
        tags.tagBackgroundColor = UIColor(hexString: "676BE9", alpha: 0.54)
        tags.textColor = .white
        tags.cornerRadius = 5
        tags.paddingX = view.frame.width/40
        tags.paddingY = view.frame.width/60
        tags.marginX = view.frame.width/40
        tags.marginY = view.frame.width/80
        tags.alignment = .left // possible values are .left, .center, and .right
        tags.addTags(["food", "weddings", "animals", "landscapes", "headshots", "graduation", "portraits", "sports", "prom"])
        view.addSubview(tags)
    }
    
    func setUpDesc() {
        descLabel = UILabel(frame: CGRect(x: tagsLabel.frame.minX, y: tags.frame.maxY + view.frame.height/30, width: view.frame.width, height: view.frame.height/30))
        descLabel.font = UIFont(name: "AvenirNext-Regular", size: 20)
        descLabel.text = "a bit about me..."
        view.addSubview(descLabel)
        
        descField = UITextView(frame: CGRect(x: tagsLabel.frame.minX, y: descLabel.frame.maxY, width: view.frame.width * 0.9, height: view.frame.height/6))
        descField.font = UIFont(name: "AvenirNext-Regular", size: 16)
        descField.text = "i take cool photos"
        descField.textContainer.lineBreakMode = .byClipping
        view.addSubview(descField)
    }
    
    func setUpDone() {
        doneButton = UIButton(frame: CGRect(x: view.frame.width * 0.8, y: 0, width: view.frame.width * 0.2, height: view.frame.height/30))
        doneButton.center.y = titleLabel.frame.midY
        doneButton.setImage(UIImage(named: "check"), for: .normal)
        doneButton.imageView?.contentMode = .scaleAspectFit
        doneButton.addTarget(self, action: #selector(finished), for: .touchUpInside)
        view.addSubview(doneButton)
    }
}
