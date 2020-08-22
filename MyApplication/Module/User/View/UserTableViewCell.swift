//
//  UserTableViewCell.swift
//  MyApplication
//
//  Created by Shubham Garg on 30/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import UIKit
import SDWebImage
class UserTableViewCell: UITableViewCell {

    @IBOutlet var userNameLbl: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setData(user:UserViewModel){
        userNameLbl.text = user.userName
        userImageView.sd_setImage(with: user.userImageUrl, completed: nil)
    }

}
