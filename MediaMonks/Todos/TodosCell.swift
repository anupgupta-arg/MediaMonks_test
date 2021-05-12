//
//  TodosCell.swift
//  MediaMonks
//
//  Created by Anup Gupta on 13/05/21.
//

import UIKit

class TodosCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var statusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusView.layer.cornerRadius = 5;
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
