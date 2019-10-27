//
//  PhotographerVC - Firebase.swift
//  gleam
//
//  Created by Candace Chiang on 10/27/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import ZKCarousel

extension PhotographerViewController {
    func getImages() {
        let imagesRef = Storage.storage().reference().child("images").child(self.user.id)
        
        let group = DispatchGroup()
        for num in self.user.images {
            group.enter()
            let image = imagesRef.child(num)
            image.getData(maxSize: 30 * 1024 * 1024) { data, error in
                self.selectedImages.append(ZKCarouselSlide(image: UIImage(data: data!)!, title: "", description: ""))
                print("got an image")
                self.updateCarousel()
                group.leave()
            }
        }
        
        let prof = imagesRef.child("profile")
        prof.getData(maxSize: 30 * 1024 * 1024) { data, error in
            if error != nil {
                self.profileImage.image = UIImage(named: "Icon")
            } else {
                self.profileImage.image = UIImage(data: data!)
            }
        }
    }
}
