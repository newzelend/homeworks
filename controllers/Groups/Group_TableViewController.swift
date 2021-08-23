//
//  Group_TableViewController.swift
//  vk_server
//
//  Created by Grisha Pospelov on 23.08.2021.
//

import UIKit

class Group_TableViewController: UITableViewController {
    var groupItems: [GroupItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GroupAPI(Session.instance).get{ [weak self] groups in
            guard let self = self else { return }
            self.groupItems = groups!.response.items
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if groupItems[indexPath.row].groupDescription == "" {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCellNoDesc") as? GroupTableViewCellNoDesc
            else { return UITableViewCell() }
            
            cell.configure(groupItems[indexPath.row])
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupTableViewCell
            else { return UITableViewCell() }
            
            cell.configure(groupItems[indexPath.row])
            return cell
            
        }
    }
}
