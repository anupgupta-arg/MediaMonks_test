//
//  UserDetailsCell.swift
//  MediaMonks
//
//  Created by Anup Gupta on 17/05/21.
//

import UIKit

class UserDetailsCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
