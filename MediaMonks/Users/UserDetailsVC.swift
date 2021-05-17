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
    @IBOutlet var userDetailsTable: UITableView!
    fileprivate var cellHeight = 62
    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailsTable.delegate = self
        userDetailsTable.dataSource = self
        userDetailsTable.tableFooterView = UIView()
        setUserDetails();
        
        
        userDetailsTable.register(UINib(nibName:"UserDetailsCell",bundle: nil), forCellReuseIdentifier: "UserDetailsCellID")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func userPostButtonAction(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "UsersPosts", bundle: nil);
        let vc = storyBoard.instantiateViewController(identifier: "UsersPostsVCID") as UsersPostsVC
        vc.id = user?.id;
        navigationController?.pushViewController(vc, animated: true);
        
    }
    
    @IBAction func albumsButtonAction(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Albums", bundle: nil);
        let vc = storyBoard.instantiateViewController(identifier: "AlbumsVCID") as AlbumsVC
        vc.id = user?.id;
        navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func todosButtonAction(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Todos", bundle: nil);
        let vc = storyBoard.instantiateViewController(identifier: "TodosVCID") as TodosVC
        vc.id = user?.id;
        navigationController?.pushViewController(vc, animated: true);
    }
    
    
    

}

//
extension UserDetailsVC {
    
    fileprivate func setUserDetails(){
        userName.text = user?.username;
        
    }
}


extension UserDetailsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHeight);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  userDetailsTable.dequeueReusableCell(withIdentifier: "UserDetailsCellID") as! UserDetailsCell
        
        // let user = Users[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Name"
            cell.subDetailsLabel.text = user?.name ?? ""
        case 1:
            cell.titleLabel.text = "Email"
            cell.subDetailsLabel.text = user?.email ?? ""
        case 2:
            cell.titleLabel.text = "Address"
            
            let street = user?.address?.street ?? ""
            let suite = user?.address?.suite  ?? ""
            let city = user?.address?.city ?? ""
            let zip = user?.address?.zipcode ?? ""
            
            let address = street + "," + suite + "," + city + "," + zip
            
            
            cell.subDetailsLabel.text = address
        case 3:
            cell.titleLabel.text = "Website"
            cell.subDetailsLabel.text = user?.website ?? ""
        case 4:
            cell.titleLabel.text = "Company"
            cell.subDetailsLabel.text = user?.company?.name ?? ""
            
        default:
            print("default")
        }
        
        let numberOfLine = cell.subDetailsLabel.calculateMaxLines();
        print("numberOfLine",numberOfLine);
        cell.subDetailsLabel.numberOfLines = numberOfLine;
        
        cellHeight = 41 + (21 * numberOfLine);
        
        return cell
        
    }
    
    
}
