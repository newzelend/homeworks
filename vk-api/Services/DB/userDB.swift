//
//  userDB.swift
//  vk_server
//
//  Created by Grisha Pospelov on 01.09.2021.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var imageURL: String?
    @objc dynamic var country: String = ""
    @objc dynamic var city: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

