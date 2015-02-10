//
//  TableViewCell.swift
//  EasyMoby
//
//  Created by Vikramaditya on 2/10/15.
//  Copyright (c) 2015 Vikramaditya. All rights reserved.
//

import UIKit
import Foundation
class TableViewCell: UITableViewCell {

    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var post: UITextView!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //userName.font = UIFont(name: "Avenir-Book", size: 16)
        //userName.textColor = UIColor.blackColor()
        
        post.font = UIFont(name: "Avenir-Book", size: 14)
        post.textColor = UIColor(white: 0.6, alpha: 1.0)
        
        //postTime.font = UIFont(name: "Avenir-Book", size: 14)
        //postTime.textColor = UIColor(white: 0.6, alpha: 1.0)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func showProfile(sender: UIButton) {
        // perform seque to profile of user
    }

}
