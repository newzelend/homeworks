//
//  friend.swift
//  vk_server
//
//  Created by Grisha Pospelov on 26.08.2021.
//

import Foundation
import RealmSwift


class FriendsResponse: Codable {
    let response: Friends
}


class Friends: Codable {
    let count: Int
    let items: [Friend]
    
    init(count: Int, items: [Friend]) {
        self.count = count
        self.items = items
    }
}



class Friend: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var lastName: String
    @objc dynamic var photo60: String
    @objc dynamic var photo90: String
    @objc dynamic var firstName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_60"
        case photo90 = "photo_90"
        case firstName = "first_name"
       
    }
}
