//
//  DisplayFriendsViewController.swift
//  vk_server
//
//  Created by Grisha Pospelov on 19.08.2021.
//

import UIKit

class DisplayFriendsViewController: UITableViewController {

    let friendsAPI = FriendsAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendsAPI.getFriends { users in
            
            //self.friends = users
            //tableView.reload
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
