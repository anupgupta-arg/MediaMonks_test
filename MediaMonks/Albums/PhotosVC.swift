//
//  PhotosVC.swift
//  MediaMonks
//
//  Created by Anup Gupta on 15/05/21.
//

import UIKit
import SDWebImage

class PhotosVC: UIViewController {

    
    var id : Int?
    var photos : Photos?
    
    @IBOutlet var photosCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotos();
        
    }
    
}


extension PhotosVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photo = photos![indexPath.row]
        let thumbnailURL = photo.thumbnailURL!;
        
        let cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCellID", for: indexPath) as! PhotosCell
        
        
        cell.PhotosImageView.sd_setImage(with: URL(string: thumbnailURL), placeholderImage: UIImage(named: "placeholder.png"))
        
       

        return cell;
        
    }
    
    
}


extension PhotosVC {
    
    fileprivate func getPhotos(){
        
        showToastAndDisableUserInteraction();
        let apiCall = TypicodeAPICall();
        apiCall.getPhotos(albumId : id!, isSuccess: { [self](isSuccess, photosList) in
            
            hideToastAndEnableUserInteraction();
            guard isSuccess && photosList != nil else{
                return
            }
            photos = photosList;
            photosCollectionView.reloadData();
            //debugLog(object: photosList!);
            // print("userPosts >>", userPosts!);
            
        })
    }
    
    
}
