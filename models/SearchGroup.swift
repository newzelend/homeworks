//
//  SearchGroup.swift
//  vk_server
//
//  Created by Grisha Pospelov on 26.08.2021.
//

import Foundation


class SearchGroups: Codable {
    let response: SearchGroup

    init(response: SearchGroup) {
        self.response = response
    }
}


class SearchGroup: Codable {
    let count: Int
    let SearchItem: [SearchItem]

    init(count: Int, items: [SearchItem]) {
        self.count = count
        self.SearchItem = items
    }
}


class SearchItem: Codable {
    let isMember, id: Int
    let photo1: String
    let photo2, photo3: String
    let type: TypeEnum
    let screenName, name: String
   

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case photo1 = "photo_1"
        case photo2 = "photo_2"
        case photo3 = "photo_3"
        case type
        case screenName = "screen_name"
        case name
        
    }

    init(isMember: Int, id: Int, photo1: String, photo2: String, photo3: String, type: TypeEnum, screenName: String, name: String) {
        self.isMember = isMember
        self.id = id
        self.photo100 = photo100
        self.isAdvertiser = isAdvertiser
        self.isAdmin = isAdmin
        self.photo50 = photo50
        self.photo200 = photo200
        self.type = type
        self.screenName = screenName
        self.name = name
       
    }
}

enum TypeEnum: String, Codable {
    case group = "group"
    case page = "page"
}

