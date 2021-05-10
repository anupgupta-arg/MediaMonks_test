//
//  SideMenu.swift
//  MediaMonks
//
//  Created by Anup Gupta on 10/05/21.
//

import UIKit

class SideMenuVC: UIViewController {

    
    @IBOutlet var sideMenuTable: UITableView!
    
override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        sideMenuTable.register(UINib(nibName:"SideMenuTableViewCell",bundle: nil), forCellReuseIdentifier: "SideMenuTableViewCellID")
        
        sideMenuTable.tableFooterView = UIView()
       
    }
    
}

extension SideMenuVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : SideMenuTableViewCell = sideMenuTable.dequeueReusableCell(withIdentifier: "SideMenuTableViewCellID") as! SideMenuTableViewCell
        var menuLabelName : String = "";
        
        switch indexPath.row {
        case 0:
            menuLabelName = POSTS_LABEL
            print("0")
            
        case 1:
            menuLabelName = ALBUMS_LABEL
            print("1")
            
        case 2:
            menuLabelName = PHOTOS_LABEL
            print("2")
        case 3:
            menuLabelName = TODOS_LABEL
            print("3")
            
        case 4:
            menuLabelName = USERS_LABEL
            print("4")
            
        default:
            print("default");
        }
        
        cell.menuLabelName.text = menuLabelName;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Index>>", indexPath.row);
        
        switch indexPath.row {
        case 0:
           dismiss(animated: true, completion: nil)
           print("0: POSTS_LABEL")
        case 1:
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil);
            let vc = storyBoard.instantiateViewController(identifier: "AlbumsVCID");
            navigationController?.pushViewController(vc, animated: true);
            
            print("1: ALBUMS_LABEL")
            dismiss(animated: true, completion: nil)
        case 2:
            let storyBoard = UIStoryboard.init(name: "Photos", bundle: nil);
            let vc = storyBoard.instantiateViewController(identifier: "PhotosVCID");
            navigationController?.pushViewController(vc, animated: true);
            
            print("2: PHOTOS_LABEL")
            dismiss(animated: true, completion: nil)
        case 3:
            let storyBoard = UIStoryboard.init(name: "Todos", bundle: nil);
            let vc = storyBoard.instantiateViewController(identifier: "TodosVCID");
            navigationController?.pushViewController(vc, animated: true);
            
            print("3: TODOS_LABEL")
            dismiss(animated: true, completion: nil)
            
        case 4:
            let storyBoard = UIStoryboard.init(name: "Users", bundle: nil);
            let vc = storyBoard.instantiateViewController(identifier: "UsersVCID");
            navigationController?.pushViewController(vc, animated: true);
           
            print("4: USERS_LABEL")
            dismiss(animated: true, completion: nil)
            
            
        default:
            
            print("default");
        }
    }
    
    
    
}


