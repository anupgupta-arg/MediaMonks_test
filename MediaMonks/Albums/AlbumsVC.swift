//
//  AlbumsVC.swift
//  MediaMonks
//
//  Created by Anup Gupta on 10/05/21.
//

import UIKit

class AlbumsVC: UIViewController {

    @IBOutlet var albumTable: UITableView!
    
    var albums : Albums?
    var id : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        albumTable.dataSource = self;
        albumTable.delegate = self;
        
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
    
    
}

// API call
extension AlbumsVC {
    fileprivate func getAlbums(id : Int){
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
