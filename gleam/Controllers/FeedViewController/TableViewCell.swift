//
//  TableViewCell.swift
//  gleam
//
//  Created by Carol Wang on 10/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var picture: UIImageView!
    
    var nameLabel: UILabel!
    var locationLabel: UILabel!
    var radiusLabel: UILabel!
    var ratesLabel: UILabel!

    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.size.width = UIScreen.main.bounds.width * 5/6
            super.frame = frame
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // add shadow on cell
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.50
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.white.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initCellFrom(size: CGSize) {
        // add shadow on cell
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.50
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.white.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        
        contentView.backgroundColor = UIColor(hexString: "#E6E6DD")
        
        picture = UIImageView(frame: CGRect(x: size.width/15, y: size.height/8, width: size.height * 2/5, height: size.height * 2/5))
        picture.contentMode = .scaleAspectFit
        picture.image = UIImage(named: "default-profile")
        contentView.addSubview(picture)
        
        nameLabel = UILabel(frame: CGRect(x: picture.frame.maxX + 15, y: picture.frame.midY - size.height/5 - 5, width: size.width * 3/4, height: 27))
        nameLabel.font = UIFont(name: "AvenirNext-Regular", size: 23)
        nameLabel.text = "Mary Xu"
        nameLabel.textColor = UIColor(hexString: "#232429")
        contentView.addSubview(nameLabel)
        
        let locationImage = UIImageView(frame: CGRect(x: picture.frame.maxX + 15, y: nameLabel.frame.maxY, width: 20, height: 20))
        locationImage.contentMode = .scaleAspectFit
        locationImage.image = UIImage(named: "location")
        contentView.addSubview(locationImage)
        
        locationLabel = UILabel(frame: CGRect(x: locationImage.frame.maxX + 5, y: nameLabel.frame.maxY, width: size.width/2, height: 20))
        locationLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        locationLabel.textColor = UIColor(hexString: "#232429").withAlphaComponent(0.7)
        locationLabel.text = "Berkeley, CA"
        contentView.addSubview(locationLabel)

        let radiusImage = UIImageView(frame: CGRect(x: picture.frame.maxX + 15, y: locationLabel.frame.maxY, width: 20, height: 20))
        radiusImage.contentMode = .scaleAspectFit
        radiusImage.image = UIImage(named: "radius")
        contentView.addSubview(radiusImage)
        
        radiusLabel = UILabel(frame: CGRect(x: radiusImage.frame.maxX + 5, y: locationLabel.frame.maxY, width: size.width/2, height: 20))
        radiusLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        radiusLabel.textColor = UIColor(hexString: "#232429").withAlphaComponent(0.7)
        radiusLabel.text = "5 mile travel radius"
        contentView.addSubview(radiusLabel)
            
        let ratesImage = UIImageView(frame: CGRect(x: picture.frame.maxX + 15, y: radiusLabel.frame.maxY, width: 20, height: 20))
        ratesImage.contentMode = .scaleAspectFit
        ratesImage.image = UIImage(named: "money")
        contentView.addSubview(ratesImage)
        
        ratesLabel = UILabel(frame: CGRect(x: ratesImage.frame.maxX + 5, y: radiusLabel.frame.maxY, width: size.width/2, height: 20))
        ratesLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        ratesLabel.textColor = UIColor(hexString: "#232429").withAlphaComponent(0.7)
        ratesLabel.text = "50 - 100 per hour"
        contentView.addSubview(ratesLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
