//
//  FeedVC - UI Setup.swift
//  gleam
//
//  Created by Mary Xu on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension FeedViewController {
    func setUpButtons() {
        button = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 3/4, height: 40))
        button.center = CGPoint(x: view.frame.width/2, y: view.frame.height/4)
        button.setTitle("Account", for: .normal)
        button.titleLabel!.font = UIFont(name: "AvenirNext-Bold", size: 30)
        button.setTitleColor(UIColor(hexString: "000000"), for: .normal)
        button.addTarget(self, action: #selector(go), for: .touchUpInside)
        view.addSubview(button)
    }
}
