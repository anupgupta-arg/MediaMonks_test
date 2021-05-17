//
//  TodosVC.swift
//  
//
//  Created by Anup Gupta on 10/05/21.
//

import UIKit
import Alamofire

class TodosVC: UIViewController {

    @IBOutlet var todosTableView: UITableView!
    var todos: Todos?
    var id : Int?
    
    override func viewDidLoad() {
        todosTableView.delegate = self;
        todosTableView.dataSource = self;
        
        todosTableView.tableFooterView = UIView();
        getTods(id: id!);
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

// Table View
extension TodosVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TodosCell = todosTableView.dequeueReusableCell(withIdentifier: "TodosCellID") as! TodosCell
        
        let todo = todos![indexPath.row];
        
        cell.titleLabel.text = todo.title;
        if todo.completed! {
            cell.statusView.backgroundColor = .green
        }else{
            cell.statusView.backgroundColor = .red
        }
        
        return cell;
    }
    
    
}

// API Call
extension TodosVC {
    
    fileprivate func getTods(id : Int){
        guard NetworkReachabilityManager()!.isReachable else {
            showAlert(title: NETWORK_ERROR_TITLE, message: NETWORK_ERROR_MESSAGE)
            return
        }
        showToastAndDisableUserInteraction();
        let apiCall = TypicodeAPICall();
        apiCall.getTodos(userid: id ,isSuccess: { [self](isSuccess, todoList) in

            hideToastAndEnableUserInteraction();
            guard isSuccess && todoList != nil else{
                return
            }
            todos = todoList;
            todosTableView.reloadData();
          //  debugLog(object: todos!);
            // print("userPosts >>", userPosts!);

        })

    }
}
