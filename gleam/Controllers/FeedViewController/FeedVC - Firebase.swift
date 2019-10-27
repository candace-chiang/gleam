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
            //var newUsers: [User] = []
            
            for (key, value) in allUsers {
                //let user = User(id: key, user: value as! [String : Any])
                /*let image = imagesRef.child(key)
                image.getData(maxSize: 30 * 1024 * 1024) { data, error in
                    if let error = error {
                        event.image = UIImage(named: "fox lick")
                    } else {
                        event.image = UIImage(data: data!)
                    }
                }
                newEvents.append(event)*/
            }
            //self.events = newUsers.sorted(by: { $0.da > $1.date })
            self.tableView.reloadData()
        })
    }
}
