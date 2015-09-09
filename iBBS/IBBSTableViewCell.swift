//
//  IBBSTableViewCell.swift
//  iBBS
//
//  Created by Augus on 9/2/15.
//  Copyright © 2015 iAugus. All rights reserved.
//

import UIKit
import SwiftyJSON

class IBBSTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfireImage: UIImageView!{
        didSet{
            userProfireImage.clipsToBounds = true
            userProfireImage.layer.borderWidth = 0.3
            userProfireImage.layer.borderColor = UIColor.blackColor().CGColor
            userProfireImage.layer.cornerRadius = 18.0
            userProfireImage.backgroundColor = UIColor.randomColor()
        }
    }
    @IBOutlet weak var topicLabel: UILabel!    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
//        self.backgroundColor = UIColor.clearColor()
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsetsZero
        self.layoutMargins = UIEdgeInsetsZero
    }

    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func loadDataToCell(json: JSON){
        let avatarUrl = NSURL(string: json["avatar"].stringValue)
        self.userProfireImage?.sd_setImageWithURL(avatarUrl)
        self.topicLabel?.text = json["title"].stringValue
    }
   
}