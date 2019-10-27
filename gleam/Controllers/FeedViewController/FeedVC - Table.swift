//
//  FeedVC - Table.swift
//  gleam
//
//  Created by Carol Wang on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listings.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/6
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 10))
        view.backgroundColor = UIColor.clear
        return view;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        let size = CGSize(width: tableView.frame.width, height: view.frame.height/4)
        cell.initCellFrom(size: size)
        
        let user = listings[indexPath.section]
        
        cell.nameLabel.text = user.name
        if user.location != "" {
            cell.locationLabel.text = user.location
        }
        if (user.radius != nil) {
            cell.radiusLabel.text = "\(String(describing: user.radius!)) mile travel radius"
        }
        if user.rates != "" {
            cell.ratesLabel.text = "\(String(describing: user.rates!)) per hour"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tableCell = cell as! TableViewCell
        tableCell.contentView.layer.masksToBounds = true
        let radius = tableCell.contentView.layer.cornerRadius
        tableCell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = listings[indexPath.row]
        performSegue(withIdentifier: "feedToPhotographerProfile", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
