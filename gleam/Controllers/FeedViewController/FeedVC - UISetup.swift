//
//  FeedVC - UISetup.swift
//  gleam
//
//  Created by Carol Wang on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension FeedViewController {
    func setUpBackground() {
        view.backgroundColor = UIColor(hexString: "#232429")
        
        profileImage = UIImageView(frame: CGRect(x: view.frame.width - 55, y: 60, width: 45, height: 45))
        profileImage.contentMode = .scaleAspectFit
        profileImage.image = UIImage(named: "default-profile")
        let profileTap = UITapGestureRecognizer(target: self, action: #selector(FeedViewController.toProfile))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(profileTap)
        view.addSubview(profileImage)
        
        filterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: 30))
        filterLabel.center = CGPoint(x: view.frame.width/2, y: view.frame.height/15 + 50)
        filterLabel.font = UIFont(name: "AvenirNext-Regular", size: 27)
        filterLabel.textColor = UIColor(hexString: "E6E6DD")
        filterLabel.textAlignment = .center
        let text = NSMutableAttributedString(string: "filter by distance ")
    text.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 10, length: 8))
    text.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "E6E6DD"), range: NSRange(location: 0, length: text.length))
        let arrow = NSMutableAttributedString(string: "\u{25BE}", attributes: [NSAttributedString.Key.font: UIFont(name: "AvenirNext-Regular", size: 30)!])
        text.append(arrow)
        filterLabel.attributedText = text
        let tap = UITapGestureRecognizer(target: self, action: #selector(FeedViewController.selectFilter))
        filterLabel.isUserInteractionEnabled = true
        filterLabel.addGestureRecognizer(tap)
        view.addSubview(filterLabel)
    }
    
    func setUpTable() {
        tableView = UITableView(frame: CGRect(x: UIScreen.main.bounds.width/12, y: filterLabel.frame.maxY + view.frame.height/15, width: UIScreen.main.bounds.width * 5/6, height: view.frame.height * 17/24))
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = view.frame.height/6
        tableView.backgroundColor = UIColor(hexString: "#232429")
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
    }
}
