//
//  DateViewController.swift
//  vk_server
//
//  Created by Grisha Pospelov on 19.08.2021.
//

import UIKit

class DateViewController: UITableViewController {
    
    let friendAPI = FriendAPI()
    let photoAPI = PhotoAPI()
    let groupAPI = GroupAPI()
    let searchGroupAPI = SearchGroupAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendAPI.getFriends { users in
            
        }
        photoAPI.getPhotos { users in
            
        }
        groupAPI.getGroups { users in
            
        }
        searchGroupAPI.getSearchGroups { users in
            
        }
    }
}
