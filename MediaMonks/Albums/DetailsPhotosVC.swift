//
//  DetailsPhotosVC.swift
//  MediaMonks
//
//  Created by Anup Gupta on 16/05/21.
//

import UIKit

class DetailsPhotosVC: UIViewController {
    var photo : Photo?
    
    @IBOutlet var photoImageView: UIImageView!
    
    @IBOutlet var photoTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
        
    }
    
    
    fileprivate func setDetails(){
        
        
        let url = photo?.url!
        photoImageView.sd_setImage(with: URL(string: url!), placeholderImage: nil)
        photoTitle.text = photo?.title!;
        
    }
}
