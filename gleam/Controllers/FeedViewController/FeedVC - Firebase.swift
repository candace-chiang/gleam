//
//  FeedVC - Firebase.swift
//  gleam
//
//  Created by Carol Wang on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

extension FeedViewController {
    func getAllListings() {
        let usersRef = Database.database().reference().child("Users")
        
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
            let allUsers = snapshot.value as? [String : Any] ?? [:]
            var newUsers: [User] = []
            
            for (key, value) in allUsers {
                let user = User(id: key, user: value as! [String : Any])
                /*let image = imagesRef.child(key)
                image.getData(maxSize: 30 * 1024 * 1024) { data, error in
                    if let error = error {
                        event.image = UIImage(named: "fox lick")
                    } else {
                        event.image = UIImage(data: data!)
                    }
                }*/
                if user.photographer {
                    newUsers.append(user)
                }
            }
            //self.events = newUsers.sorted(by: { $0.da > $1.date })
            if self.sortBy == "low to high" {
                self.listings = newUsers.sorted(by: {
                    (String($0.rates[..<$0.rates.firstIndex(of: " ")!]) as NSString).integerValue <
                        (String($1.rates[..<$1.rates.firstIndex(of: " ")!]) as NSString).integerValue
                })
            } else if self.sortBy == "high to low" {
                self.listings = newUsers.sorted(by: {
                    (String($0.rates[..<$0.rates.firstIndex(of: " ")!]) as NSString).integerValue >
                        (String($1.rates[..<$1.rates.firstIndex(of: " ")!]) as NSString).integerValue
                })
            } else {
                self.listings = newUsers
            }
            self.tableView.reloadData()
        })
    }
}
