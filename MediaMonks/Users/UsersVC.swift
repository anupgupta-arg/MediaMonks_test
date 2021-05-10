//
//  UsersVC.swift
//  MediaMonks
//
//  Created by Anup Gupta on 10/05/21.
//

import UIKit

class UsersVC: UIViewController {

    @IBOutlet var usersTable: UITableView!
    
//    usersTableCellID
    var users : Users?
    override func viewDidLoad() {
        usersTable.delegate = self;
        usersTable.dataSource = self;
        usersTable.tableFooterView = UIView();
        super.viewDidLoad()
        getUsers();
    }
    
}

// Table View

extension UsersVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersTable.dequeueReusableCell(withIdentifier: "usersTableCellID")
        
        let user = users![indexPath.row]
        
        cell?.textLabel?.text = user.name;
        cell?.detailTextLabel?.text = user.email;
        
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users![indexPath.row];
        moveToUserDetails(userDetails: user);
        
    }
    
    
}

extension UsersVC {
    fileprivate func moveToUserDetails(userDetails : User){
        
        let storyBoard = UIStoryboard.init(name: "Users", bundle: nil);
        let vc = storyBoard.instantiateViewController(identifier: "UserDetailsVCID") as! UserDetailsVC
        vc.user = userDetails;
        navigationController?.pushViewController(vc, animated: true);
    }
    
}




// API call
extension UsersVC {
    
    
    fileprivate func getPosts(id : Int){
        let obj = TypicodeAPICall();
        showToastAndDisableUserInteraction();
        obj.getUserPosts(userid: id) { [self] (isSuccess, userPosts) in
            hideToastAndEnableUserInteraction();
            guard isSuccess && userPosts != nil else{
                return
            }
            
            
            
        }
        
    }
    
    fileprivate func getUsers(){
        showToastAndDisableUserInteraction();
        let apiCall = TypicodeAPICall();
        apiCall.getUsers(isSuccess: { [self](isSuccess, userList) in
            
            hideToastAndEnableUserInteraction();
            guard isSuccess && userList != nil else{
                return
            }
            users = userList;
            usersTable.reloadData();
            //debugLog(object: albumList!);
            // print("userPosts >>", userPosts!);
            
        })
        
    }
}
