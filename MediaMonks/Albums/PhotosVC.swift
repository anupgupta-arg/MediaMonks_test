//
//  PhotosVC.swift
//  MediaMonks
//
//  Created by Anup Gupta on 15/05/21.
//

import UIKit
import SDWebImage
import Alamofire

class PhotosVC: UIViewController {
    
    var id : Int?
    var photos : Photos?
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 3
    
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
        
        
        cell.PhotosImageView.sd_setImage(with: URL(string: thumbnailURL), placeholderImage: nil)
        return cell;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos![indexPath.row]
    
        moveToDetailPhotos(photo: photo)
        
        
        
    }
    
    
}


extension PhotosVC {
    fileprivate func moveToDetailPhotos(photo : Photo){
        
        let storyBoard = UIStoryboard.init(name: "Albums", bundle: nil);
        let vc = storyBoard.instantiateViewController(identifier: "DetailsPhotosVCID") as! DetailsPhotosVC
        vc.photo = photo;
        navigationController?.present(vc, animated: true, completion: nil)
//        navigationController?.pushViewController(vc, animated: true);
    }
}

// Flow Layout Delegate
extension PhotosVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    
}


extension PhotosVC {
    
    fileprivate func getPhotos(){
        
        guard NetworkReachabilityManager()!.isReachable else {
            showAlert(title: NETWORK_ERROR_TITLE, message: NETWORK_ERROR_MESSAGE)
            return
        }
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
