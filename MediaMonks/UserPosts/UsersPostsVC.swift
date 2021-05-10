//
//  UsersPostsVC.swift
//  MediaMonks
//
//  Created by Anup Gupta on 11/05/21.
//

import UIKit

class UsersPostsVC: UIViewController {

    var usersPosts : UsersPosts?
    var id : Int?
    
    @IBOutlet var userPostsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPostsTable.delegate = self;
        userPostsTable.dataSource = self;
        getUsersPosts();
    }
}


extension UsersPostsVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersPosts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userPostsTable.dequeueReusableCell(withIdentifier: "userPostCellID");
        
        
        let post = usersPosts![indexPath.row];
        
        cell?.textLabel?.numberOfLines = 3;
        cell?.detailTextLabel?.numberOfLines = 3;
        cell?.textLabel?.text = post.title;
        cell?.detailTextLabel?.text = post.body;
        
        
        return cell!;
    }
    
    
}


// API call
extension UsersPostsVC {

    fileprivate func getUsersPosts(){
        showToastAndDisableUserInteraction();
        let apiCall = TypicodeAPICall();
        apiCall.getUserPosts(userid: id! ,isSuccess: { [self](isSuccess, usersPostsList) in

            hideToastAndEnableUserInteraction();
            guard isSuccess && usersPostsList != nil else{
                return
            }
            usersPosts = usersPostsList;
            userPostsTable.reloadData();
            //debugLog(object: albumList!);
            // print("userPosts >>", userPosts!);

        })

    }

}


