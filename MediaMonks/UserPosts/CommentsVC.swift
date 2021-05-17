//
//  CommentsVC.swift
//  MediaMonks
//
//  Created by Anup Gupta on 12/05/21.
//

import UIKit
import Alamofire

class CommentsVC: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var commentsTable: UITableView!
    
    var comments : Comments?
    
    var post : UsersPost?
    var cellHeight = 88
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTable.delegate = self;
        commentsTable.dataSource = self;
        
        titleLabel.text = post?.title;
        let titleLableSize = titleLabel.calculateMaxLines();
        titleLabel.numberOfLines = titleLableSize;
        
        messageLabel.text = post?.body;
        let messageLableSize = messageLabel.calculateMaxLines();
        messageLabel.numberOfLines = messageLableSize;
        commentsTable.register(UINib(nibName:"CommentsCell",bundle: nil), forCellReuseIdentifier: "CommentsCellID")
        
        getComments(id: post!.id);
    }
    

}


extension CommentsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CommentsCell = self.commentsTable.dequeueReusableCell(withIdentifier: "CommentsCellID")! as! CommentsCell
        
        let comment = comments![indexPath.row]
        
        
        cell.nameLabel.text = comment.name;
        cell.emailLabel.text = comment.email;
        cell.messageLabel.text = comment.body;
        let numberOfMessageLine = cell.messageLabel.calculateMaxLines();
        print("numberOfMessageLine",numberOfMessageLine);
        cell.messageLabel.numberOfLines = numberOfMessageLine;
        
        cellHeight = 67 + (21 * numberOfMessageLine);
        
        
        
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("****")
        return CGFloat(cellHeight);
    }
    
    
}



// API Call
extension CommentsVC {
    
    fileprivate func getComments(id : Int){
        guard NetworkReachabilityManager()!.isReachable else {
            showAlert(title: NETWORK_ERROR_TITLE, message: NETWORK_ERROR_MESSAGE)
            return
        }
        showToastAndDisableUserInteraction();
        let apiCall = TypicodeAPICall();
        apiCall.getComments(postid: id, isSuccess: { [self](isSuccess, commentsList) in

            hideToastAndEnableUserInteraction();
            guard isSuccess && commentsList != nil else{
                return
            }
            comments = commentsList;
            commentsTable.reloadData();
            //debugLog(object: albumList!);
            // print("userPosts >>", userPosts!);

        })

    }
}





