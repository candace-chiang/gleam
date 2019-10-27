//
//  LocationVC - UISetup.swift
//  gleam
//
//  Created by Mary Xu on 10/27/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import MapKit

extension LocationViewController {
    func setUpBackground() {
        backCardView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 9/10, height: 300))
        backCardView.center = CGPoint(x: view.frame.width/2, y:view.frame.height * 2/5)
        backCardView.backgroundColor = UIColor(hexString: "FFFFFF")
        backCardView.layer.cornerRadius = 20
        view.addSubview(backCardView)
        
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        searchController = UISearchController(searchResultsController: locationSearchTable)
        searchController?.searchResultsUpdater = locationSearchTable
        let searchBar = searchController!.searchBar
        searchBar.alignmentRect(forFrame: CGRect(x: 0, y: 0, width: view.frame.width * 9/10, height: 50))
        searchBar.placeholder = "my location..."
        searchBar.center = CGPoint(x: view.frame.width/2, y: backCardView.frame.minY + view.frame.height/20)
        view.addSubview(searchBar)
        // navigationItem.titleView = searchController?.searchBar
        searchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        locationSearchTable.mapView = mapView
    }
    
    func setUpButtons() {
        closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/20))
        closeButton.center = CGPoint(x: view.frame.width/2, y: backCardView.frame.maxY - view.frame.height/30)
        closeButton.setTitle("close", for: .normal)
        closeButton.titleLabel!.font = UIFont(name: "AvenirNext-Regular", size: 18)
        closeButton.setTitleColor(UIColor(hexString: "232429").withAlphaComponent(0.7), for: .normal)
        closeButton.contentHorizontalAlignment = .center
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        view.addSubview(closeButton)
        
        saveButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: view.frame.height/30))
        saveButton.center = CGPoint(x: view.frame.width/2, y: closeButton.frame.minY - view.frame.height/30)
        saveButton.setTitle("save", for: .normal)
        saveButton.titleLabel!.font = UIFont(name: "AvenirNext-Regular", size: 18)
        saveButton.setTitleColor(UIColor(hexString: "232429").withAlphaComponent(0.7), for: .normal)
        saveButton.contentHorizontalAlignment = .center
        saveButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        view.addSubview(saveButton)
    }
}

