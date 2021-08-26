//
//  group.swift
//  vk_server
//
//  Created by Grisha Pospelov on 26.08.2021.
//

import Foundation
import RealmSwift

// MARK: - Groups
class Groups: Codable {
    let response: GroupsResponse

}

// MARK: - Response
class GroupsResponse: Codable {
    let count: Int
    let items: [Group]
    
    init(count: Int, items: [Group]) {
        self.count = count
        self.items = items
    }
}
class Group: Object, Codable {
    @objc dynamic var isMember, id: Int
    @objc dynamic var photo0: String
    @objc dynamic var isAdvertiser, isAdmin: Int
    @objc dynamic var photo0: String
    @objc dynamic var photo1: String
    @objc dynamic var photo1: String
    @objc dynamic var type, screenName: String
    @objc dynamic var name: String


    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo1 = "photo_1"
        case photo2 = "photo_2"
        case photo100 = "photo_0"
        case type
        case screenName = "screen_name"
        case name
       
    }
}
