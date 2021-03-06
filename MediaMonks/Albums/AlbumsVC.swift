//
//  AlbumsVC.swift
//  MediaMonks
//
//  Created by Anup Gupta on 10/05/21.
//

import UIKit
import Alamofire

class AlbumsVC: UIViewController {

    @IBOutlet var albumTable: UITableView!
    
    var albums : Albums?
    var id : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        albumTable.dataSource = self;
        albumTable.delegate = self;
        albumTable.tableFooterView = UIView();
        getAlbums(id: id!);
    }
    

}


// Table
extension AlbumsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = albumTable.dequeueReusableCell(withIdentifier: "AlbumsCellID")
        
        let album = albums![indexPath.row]
        cell?.textLabel?.numberOfLines = 3;
        cell?.textLabel?.text = album.title;
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums![indexPath.row]
        moveToPhotos(id: album.id!)
        
    }
    
    
}

extension AlbumsVC {
    fileprivate func moveToPhotos(id : Int){
        
        let storyBoard = UIStoryboard.init(name: "Albums", bundle: nil);
        let vc = storyBoard.instantiateViewController(identifier: "PhotosVCID") as! PhotosVC
        vc.id = id;
        navigationController?.pushViewController(vc, animated: true);
    }
}

// API call
extension AlbumsVC {
    fileprivate func getAlbums(id : Int){
        guard NetworkReachabilityManager()!.isReachable else {
            showAlert(title: NETWORK_ERROR_TITLE, message: NETWORK_ERROR_MESSAGE)
            return
        }
        showToastAndDisableUserInteraction();
        let apiCall = TypicodeAPICall();
        apiCall.getAlbums(userid: id, isSuccess: { [self](isSuccess, albumList) in
            
            hideToastAndEnableUserInteraction();
            guard isSuccess && albumList != nil else{
                return
            }
            albums = albumList;
            albumTable.reloadData();
            //debugLog(object: albumList!);
            // print("userPosts >>", userPosts!);
            
        })
        
    }
}
