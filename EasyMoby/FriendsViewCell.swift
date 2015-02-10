//
//  FriendsViewCell.swift
//  EasyMoby
//
//  Created by Vikramaditya on 2/10/15.
//  Copyright (c) 2015 Vikramaditya. All rights reserved.
//

import UIKit

class FriendsViewCell: UITableViewCell {
    
    @IBOutlet weak var friendCheck: UIButton!
    @IBOutlet weak var name: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
