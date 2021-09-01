//
//  GroupsDB.swift
//  vk_server
//
//  Created by Grisha Pospelov on 31.08.2021.
//

import Foundation
import RealmSwift



class GroupsDB {

     let config = Realm.Configuration(schemaVersion: 0)
     lazy var mainRealm = try! Realm(configuration: config)
     var groups: [Group] = []
    
    
     func addData(_ user: [Group]) {
        mainRealm.beginWrite()
        groups = user
        let group = Group()
        let e = self.groups.count
        var i = 0
        while i < e {
            group.id = self.groups[i].id
            group.name = self.groups[i].name
            group.photo50 = self.groups[i].photo50
            
            mainRealm.add(user)
            i = i + 1
        }
        do {
            try mainRealm.commitWrite()
        } catch {
            print(error.localizedDescription)
        }
  
     }
    func fetch() -> [Group] {

             //Прочитать объекты
             let users = mainRealm.objects(Group.self)
             print(mainRealm.configuration.fileURL)
             return Array(users)
         }
 }
