//
//  Group_TableViewController.swift
//  vk_server
//
//  Created by Grisha Pospelov on 23.08.2021.
//

import UIKit
import RealmSwift
import Firebase

class Group_TableViewController: UITableViewController {
    var groupItems: [GroupItem] = []
    let groupDB = GroupDB()
    let ref = Database.database().reference(withPath: "groups")
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let localGroupsResults = groupDB.get()
        
        token = localGroupsResults.observe { (changes: RealmCollectionChange) in
            
            switch changes {
            
            case .initial(let results):
                self.groupItems = Array(results)
                self.tableView.reloadData()
                
            case .update(let results, _, _, _):
                self.groupItems = Array(results)
                self.tableView.reloadData()
                
            case .error(let error):
                print("Ошибка.", error)
            }
        }
        
        GroupAPI(Session.instance).get{ [weak self] groups in
            guard let self = self else { return }
                self.groupDB.addUpdate(groups!.response.items)
                groups!.response.items.forEach { self.addUpdateRemote($0) }
            
            let alert = UIAlertController(title: "операция выполнена",
                                          message: "Группы добавлены в Firebase.",
                                          preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Принять",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
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
    
    private func addUpdateRemote(_ group: GroupItem) {
        let remoteGroup = GroupFB(id: group.id,
                                  name: group.name,
                                  groupDescription: group.groupDescription ?? "",
                                  imageURL: group.imageURL,
                                  membersCount: group.membersCount)
        
        let groupRef = ref.child(String(group.id))
        groupRef.setValue(remoteGroup.toAnyObject())
    }
}
