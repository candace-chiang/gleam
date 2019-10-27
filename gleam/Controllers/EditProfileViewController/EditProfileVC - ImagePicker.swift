//
//  EditProfileVC - ImagePicker.swift
//  gleam
//
//  Created by Candace Chiang on 10/27/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //image stuff
    @objc func openImageOptions(sender: UIButton) {
        //preserve description since no addTarget function
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) -> Void in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { (action) -> Void in
            self.openGallery()
        }))
        
        self.selectedButton = sender
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
        
    }
    
    func openCamera() {
        let picker = UIImagePickerController()
        picker.delegate = self
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            picker.sourceType = UIImagePickerController.SourceType.camera
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "No camera.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.selectedButton.setImage(chosenImage, for: .normal)
        if selectedButton == profileButton {
            self.profileImage = chosenImage
        } else {
            self.selectedImages.append(chosenImage)
        }
        dismiss(animated:true, completion: nil)
    }
    
}
