//
//  User.swift
//  gleam
//
//  Created by Candace Chiang on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import Foundation

class User {
    var id: String!
    var name: String!
    var email: String!
    var photographer: Bool!
    var location: String!
    var radius: Int!
    var rates: String!
    var tags: [String] = []
    var desc: String!
    var links: [String] = []
    var images: [String] = []
    
    //don't need to get playlists at first
    init(id: String, user: [String: Any]) {
        self.id = id
        self.name = user["name"] as? String
        self.email = user["email"] as? String
        self.photographer = user["photographer"] as? Bool
        self.location = user["location"] as? String
        self.radius = user["radius"] as? Int
        self.rates = user["rates"] as? String ?? "50 - 100"
        if self.rates == "" {
            self.rates = "50 - 100"
        }
        if let tags = user["tags"] as? [String] {
            self.tags = tags
        }
        self.desc = user["description"] as? String
        if let links = user["links"] as? [String] {
            self.links = links
        }
        if let images = user["images"] as? [String] {
            self.images = images
        }
    }
    
}
