//
//  roundedImage.swift
//  gleam
//
//  Created by Candace Chiang on 10/27/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension UIImageView {
    func setRounded() {
        self.layer.cornerRadius = self.frame.width / 2
        self.contentMode = .scaleAspectFill
        self.layer.masksToBounds = true
    }
}
