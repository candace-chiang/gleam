//
//  LocationViewController.swift
//  gleam
//
//  Created by Mary Xu on 10/27/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import MapKit

class LocationViewController: UIViewController {

    var backCardView: UIView!
    var saveButton: UIButton!
    var closeButton: UIButton!
    
    var searchController: UISearchController!
    @objc weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "232429").withAlphaComponent(0.7)
        self.showAnimate()
        self.setUpBackground()
        self.setUpButtons()
    }

    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }

    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
        });
    }
    
    @objc func close(_ sender: UIButton) {
        removeAnimate()
    }
}
