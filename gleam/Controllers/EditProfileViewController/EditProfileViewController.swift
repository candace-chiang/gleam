//
//  EditProfileViewController.swift
//  gleam
//
//  Created by Mary Xu on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import TagListView

class EditProfileViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, TagListViewDelegate {
    var user: User!
    
    var titleLabel: UILabel!
    
    var image1: UIButton!
    var image2: UIButton!
    var image3: UIButton!
    var image4: UIButton!
    var selectedButton: UIButton!
    var selectedImages: [UIImage] = []
    var selectedNums: [String] = []
    
    var profileButton: UIButton!
    var profileImage: UIImage!
    var nameLabel: UILabel!
    var locationImage: UIImageView!
    var locationField: UITextField!
    var travelImage: UIImageView!
    var travelField: UITextField!
    var priceImage: UIImageView!
    var priceField: UITextField!
    
    var location: String = ""
    var travel: Int = 0
    var price: String = ""
    
    var tagsLabel: UILabel!
    var tags: TagListView!
    var selectedTags: [String] = []
    
    var descLabel: UILabel!
    var descField: UITextView!
    var desc: String = ""
    
    var doneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitle()
        setUpImages()
        setUpInfo()
        setUpTags()
        setUpDesc()
        setUpDone()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController!.isNavigationBarHidden = true
        self.locationField.delegate = self
        self.travelField.delegate = self
        self.priceField.delegate = self
        self.tags.delegate = self
        self.descField.delegate = self
        
        if desc == "" {
            self.descField.text = "i take cool photos"
        } else {
            self.descField.text = desc
        }
    }
    
    //dismiss keyboard when you press somewhere else
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //dismiss keyboard when you press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "i take cool photos" {
            textView.text = nil
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "i take cool photos"
        }
    }
    
    @objc func locationEntered(_ sender: UITextField) {
        location = sender.text!
    }
    
    @objc func travelEntered(_ sender: UITextField) {
        travel = Int(sender.text!) ?? 0
    }
    
    @objc func priceEntered(_ sender: UITextField) {
        price = sender.text!
    }
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(sender)")
        if selectedTags.contains(title) {
            selectedTags.remove(at: selectedTags.firstIndex(of: title)!)
            tagView.tagBackgroundColor = UIColor(hexString: "676BE9", alpha: 0.54)
        } else {
            tagView.tagBackgroundColor =  UIColor(hexString: "676BE9")
            selectedTags.append(title)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoVC = segue.destination as? PhotographerViewController {
            photoVC.user = self.user
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
