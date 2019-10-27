//
//  FeedViewController.swift
//  gleam
//
//  Created by Mary Xu on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import McPicker

class FeedViewController: UIViewController {

    var user: User!
    
    var filterLabel: UILabel!
    var profileImage: UIImageView!
    
    var tableView: UITableView!
    var listings: [User]! = []
    var selected: User!
    
    var sortBy = "distance"
      
    let ref = Database.database().reference()
    
    let data: [[String]] = [
        ["distance", "lowest to highest price", "highest to lowest price"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpBackground()
        setUpTable()
        getAllListings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "feedToPhotographerProfile":
                    let detailVC = segue.destination as! PhotographerViewController
                    detailVC.user = selected
                    break
                case "feedToClientProfile":
                    let detailVC = segue.destination as! ClientProfileViewController
                    detailVC.user = user
                    break
                default: break
            }
        }
    }
    
    @objc
    func toProfile(sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "feedToClientProfile", sender: sender)
    }
    
    @objc
    func selectFilter(sender: UITapGestureRecognizer) {
        let mcPicker = McPicker(data: data)

        let fixedSpace = McPickerBarButtonItem.fixedSpace(width: 20.0)
        let flexibleSpace = McPickerBarButtonItem.flexibleSpace()
        let fireButton = McPickerBarButtonItem.done(mcPicker: mcPicker, title: "Done") // Set custom Text
        let cancelButton = McPickerBarButtonItem.cancel(mcPicker: mcPicker, barButtonSystemItem: .cancel) // or system items
        mcPicker.setToolbarItems(items: [fixedSpace, cancelButton, flexibleSpace, fireButton, fixedSpace])

        mcPicker.toolbarItemsFont = UIFont(name:"AvenirNext-Regular", size: 18)!

        mcPicker.pickerBackgroundColor = .gray
        mcPicker.show(doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            var name = selections[0]
            if name != nil {
                if name == "highest to lowest price" {
                    name = "high to low"
                }
                if name == "lowest to highest price" {
                    name = "low to high"
                }
                let text = NSMutableAttributedString(string: "filter by \(String(describing: name!)) ")
                text.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 10, length: name!.count))
                text.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "E6E6DD"), range: NSRange(location: 0, length: text.length))
                let arrow = NSMutableAttributedString(string: "\u{25BE}", attributes: [NSAttributedString.Key.font: UIFont(name: "AvenirNext-Regular", size: 30)!])
                text.append(arrow)
                self!.sortBy = name!
                self!.filterLabel.attributedText = text
                self!.getAllListings()
            }
        })
    }
}
