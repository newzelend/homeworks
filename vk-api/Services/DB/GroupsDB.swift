//
//  GroupsDB.swift
//  vk_server
//
//  Created by Grisha Pospelov on 01.09.2021.
//

import Foundation
import RealmSwift

protocol GroupDBProtocol {
    
    func get() -> Results<GroupItem>
    func addUpdate(_ groups: [GroupItem])
}

class GroupDB: GroupDBProtocol {
    
    let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    lazy var mainRealm = try! Realm(configuration: config)
    
    func get() -> Results<GroupItem> {
        
        let groups = mainRealm.objects(GroupItem.self)
        return groups
    }
    
    func addUpdate(_ groups: [GroupItem]) {
        
        do {
            mainRealm.beginWrite()
            groups.forEach{ mainRealm.add($0, update: .all) }
            try mainRealm.commitWrite()
        } catch {
            print(error)
        }
    }
}
