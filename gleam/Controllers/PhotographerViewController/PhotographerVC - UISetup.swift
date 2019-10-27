//
//  PhotographerVC - UISetup.swift
//  gleam
//
//  Created by Candace Chiang on 10/27/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import ZKCarousel
import TagListView

extension PhotographerViewController {
    func setUpCarousel() {
        carousel = ZKCarousel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.4))
        let slide = [ZKCarouselSlide(image: UIImage(named: "loading")!, title: "", description: "")]
        carousel.slides = slide
        view.addSubview(carousel)
    }
    
    func updateCarousel() {
        carousel.slides = self.selectedImages
    }
    
    func setUpInfo() {
        profileImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.3, height: view.frame.width * 0.3))
        profileImage.center = CGPoint(x: view.frame.width * 0.21, y: view.frame.height * 0.5)
        profileImage.contentMode = .scaleAspectFit
        profileImage.image = UIImage(named: "Icon")
        profileImage.setRounded()
        view.addSubview(profileImage)
        
        let start = view.frame.width * 0.4
        nameLabel = UILabel(frame: CGRect(x: start, y: profileImage.frame.minY - view.frame.height/35, width: view.frame.width * 0.4, height: view.frame.height/17))
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
        
        locationField = UILabel(frame: CGRect(x: locationImage.frame.maxX + margin, y: 0, width: fieldWidth, height: fieldHeight))
        locationField.center.y = locationImage.frame.midY
        locationField.font = UIFont(name: "AvenirNext-Regular", size: 16)
        locationField.textColor = UIColor(hexString: "232429")
        locationField.text = self.user.location
        view.addSubview(locationField)
        
        travelImage = UIImageView(frame: CGRect(x: start, y: locationField.frame.maxY + spacing, width: iconSize, height: iconSize))
        travelImage.image = UIImage(named: "car")
        travelImage.contentMode = .scaleAspectFit
        view.addSubview(travelImage)
        
        travelField = UILabel(frame: CGRect(x: travelImage.frame.maxX + margin, y: 0, width: fieldWidth, height: fieldHeight))
        travelField.center.y = travelImage.frame.midY
        travelField.font = UIFont(name: "AvenirNext-Regular", size: 16)
        travelField.textColor = UIColor(hexString: "232429")
        travelField.text = "\(self.user.radius!) miles travel radius"
        view.addSubview(travelField)
        
        priceImage = UIImageView(frame: CGRect(x: start, y: travelField.frame.maxY + spacing, width: iconSize, height: iconSize))
        priceImage.image = UIImage(named: "cash")
        priceImage.contentMode = .scaleAspectFit
        view.addSubview(priceImage)
        
        priceField = UILabel(frame: CGRect(x: priceImage.frame.maxX + margin, y: 0, width: fieldWidth, height: fieldHeight))
        priceField.center.y = priceImage.frame.midY
        priceField.font = UIFont(name: "AvenirNext-Regular", size: 16)
        priceField.textColor = UIColor(hexString: "232429")
        priceField.text = self.user.rates + " per hour"
        view.addSubview(priceField)
    }
    
    func setUpTags() {
        tagsLabel = UILabel(frame: CGRect(x: profileImage.frame.minX, y: priceField.frame.maxY + view.frame.height/50, width: view.frame.width, height: view.frame.height/25))
        tagsLabel.font = UIFont(name: "AvenirNext-Regular", size: 20)
        tagsLabel.text = "i specialize in..."
        view.addSubview(tagsLabel)
        
        tags = TagListView(frame: CGRect(x: tagsLabel.frame.minX, y: tagsLabel.frame.maxY + view.frame.height/80, width: view.frame.width * 0.9, height: view.frame.height * 0.03))
        tags.textFont = UIFont(name: "AvenirNext-Regular", size: 16)!
        tags.tagBackgroundColor = UIColor(hexString: "676BE9", alpha: 0.54)
        tags.textColor = .white
        tags.cornerRadius = 5
        tags.paddingX = view.frame.width/40
        tags.paddingY = view.frame.width/60
        tags.marginX = view.frame.width/40
        tags.marginY = view.frame.width/80
        tags.alignment = .left // possible values are .left, .center, and .right
        tags.addTags(self.user.tags)
        view.addSubview(tags)
    }
    
    func setUpDesc() {
        descLabel = UILabel(frame: CGRect(x: tagsLabel.frame.minX, y: tags.frame.maxY + view.frame.height/30, width: view.frame.width, height: view.frame.height/30))
        descLabel.font = UIFont(name: "AvenirNext-Regular", size: 20)
        descLabel.text = "a bit about me..."
        view.addSubview(descLabel)
        
        descField = UILabel(frame: CGRect(x: tagsLabel.frame.minX, y: descLabel.frame.maxY + view.frame.height/50, width: view.frame.width * 0.9, height: view.frame.height/5))
        descField.font = UIFont(name: "AvenirNext-Regular", size: 16)
        descField.text = self.user.desc
        descField.numberOfLines = 0
        descField.frame = CGRect(x: tagsLabel.frame.minX, y: descLabel.frame.maxY + view.frame.height/50, width: view.frame.width * 0.9, height: view.frame.height/5)
        descField.sizeToFit()
        view.addSubview(descField)
    }
    
    func setUpButtons() {
        editButton = UIButton(frame: CGRect(x: view.frame.width * 0.8, y: 0, width: view.frame.width * 0.2, height: view.frame.height/30))
        editButton.center.y = view.frame.height/10
        editButton.setImage(UIImage(named: "edit"), for: .normal)
        editButton.imageView?.contentMode = .scaleAspectFit
        editButton.addTarget(self, action: #selector(calledEdit), for: .touchUpInside)
        view.addSubview(editButton)
        
        logOutButton = UIButton(frame: CGRect(x: view.frame.width * 0.7, y: view.frame.height * 0.9, width: view.frame.width/4, height: view.frame.height/30))
        logOutButton.center = CGPoint(x: view.frame.width/2, y: view.frame.height * 0.9)
        logOutButton.setTitle("sign out", for: .normal)
        logOutButton.titleLabel!.font = UIFont(name: "AvenirNext-Bold", size: 25)
        logOutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        logOutButton.setTitleColor(.black, for: .normal)
        view.addSubview(logOutButton)
    }
}
