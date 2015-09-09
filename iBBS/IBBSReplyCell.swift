//
//  IBBSReplyCell.swift
//  iBBS
//
//  Created by Augus on 9/4/15.
//  Copyright © 2015 iAugus. All rights reserved.
//

import UIKit
import SwiftyJSON

class IBBSReplyCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!{
        didSet{
            avatarImageView.layer.cornerRadius = 15.0
            avatarImageView.clipsToBounds = true
            avatarImageView.layer.borderWidth = 0.3
            avatarImageView.layer.borderColor = UIColor.blackColor().CGColor
            avatarImageView.backgroundColor = UIColor.randomColor()
        }
    }
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var replyContent: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .None
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.contentView.layoutSubviews()
//        self.replyContent.preferredMaxLayoutWidth = replyContent.frame.size.width
//    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadDataToCell(json: JSON) {
        let imageUrl = NSURL(string: json["avatar"].stringValue)
        avatarImageView.sd_setImageWithURL(imageUrl)
        usernameLabel.text = json["username"].stringValue
        let data = json["comment_content"].stringValue
        replyContent.ausAttributedText(data)
        
        
    }
}