//
//  PhotographerViewController.swift
//  gleam
//
//  Created by Mary Xu on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import ZKCarousel
import TagListView

import FirebaseAuth

class PhotographerViewController: UIViewController {
    var user: User!
    
    var selectedImages: [ZKCarouselSlide] = []
    var carousel: ZKCarousel!
    
    var profileImage: UIImageView!
    var nameLabel: UILabel!
    var locationImage: UIImageView!
    var locationField: UILabel!
    var travelImage: UIImageView!
    var travelField: UILabel!
    var priceImage: UIImageView!
    var priceField: UILabel!
    
    var tagsLabel: UILabel!
    var tags: TagListView!
    
    var descLabel: UILabel!
    var descField: UILabel!
    
    var editButton: UIButton!
    var logOutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCarousel()
        setUpInfo()
        getImages()
        setUpTags()
        setUpDesc()
        setUpButtons()
        // Do any additional setup after loading the view.
    }
    
    @objc func calledEdit() {
        self.performSegue(withIdentifier: "profileToEdit", sender: self)
    }
    
    @objc func logout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        self.performSegue(withIdentifier: "photographerLogout", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editVC = segue.destination as? EditProfileViewController {
            editVC.user = self.user
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
