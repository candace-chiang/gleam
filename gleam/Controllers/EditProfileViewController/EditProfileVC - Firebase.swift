//
//  EditProfileVC - Firebase.swift
//  gleam
//
//  Created by Candace Chiang on 10/27/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

extension EditProfileViewController {
    @objc func finished() {
        var newInfo: [String: Any] = [:]
        
        newInfo["description"] = self.descField.text!
        newInfo["location"] = self.location
        newInfo["radius"] = self.travel
        newInfo["rates"] = self.price
        newInfo["tags"] = self.selectedTags
        
        self.user.desc = self.descField.text!
        self.user.location = self.location
        self.user.radius = self.travel
        self.user.rates = self.price
        self.user.tags = self.selectedTags
        
        let imageRef = Storage.storage().reference().child("images").child(self.user.id)
        
        let group = DispatchGroup()
        var i = 0
        
        for image in self.selectedImages {
            i += 1
            group.enter()
            let data = image.pngData()!
            imageRef.child(String(i)).putData(data, metadata: nil) { (metadata, error) in
                if metadata == nil {
                    return
                }
                imageRef.downloadURL { (url, error) in
                    if url == nil {
                        return
                    }
                    group.leave()
                }
            }
        }
        
        group.enter()
        let profileData = profileImage.pngData()!
        imageRef.child("profile").putData(profileData, metadata: nil) { (metadata, error) in
            if metadata == nil {
                return
            }
            imageRef.downloadURL { (url, error) in
                if url == nil {
                    return
                }
                group.leave()
            }
        }
        
        DispatchQueue.main.async {
            self.pushUser(newInfo: newInfo)
        }
        
    }
    
    func pushUser(newInfo: [String: Any]) {
        let ref = Database.database().reference().child("Users").child(self.user.id)
        ref.updateChildValues(newInfo, withCompletionBlock: { (error, ref) in
            if error != nil {
                return
            }
            print("uh it worked?")
            self.performSegue(withIdentifier: "editToProfile", sender: self)
        })
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
