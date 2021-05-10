//
//  UserDetailsVC.swift
//  MediaMonks
//
//  Created by Anup Gupta on 11/05/21.
//

import UIKit

class UserDetailsVC: UIViewController {

    @IBOutlet var userName: UILabel!
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUserDetails();
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func userPostButtonAction(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "UsersPosts", bundle: nil);
        let vc = storyBoard.instantiateViewController(identifier: "UsersPostsVCID") as UsersPostsVC
        vc.id = user?.id;
        navigationController?.pushViewController(vc, animated: true);
        
    }
    

    

}


//
extension UserDetailsVC {
    
    fileprivate func setUserDetails(){
        userName.text = user?.name;
        
    }
}
