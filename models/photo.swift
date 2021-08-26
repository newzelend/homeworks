//
//  photo.swift
//  vk_server
//
//  Created by Grisha Pospelov on 26.08.2021.
//

import Foundation
import RealmSwift


class PhotoResponse: Codable {
    let response: Photos
    init(response: Photos){
        self.response = response
    }
}


struct Photos: Codable {
    let count: Int
    let items: [Photo]
    
    init(count: Int, items:[Photo]) {
        self.count = count
        self.items = items
    }
}


class Photo: Object, Codable {
    @objc dynamic var albumID, height: Int
    @objc dynamic var photo: String
    @objc dynamic var id: Int
    @objc dynamic var text: String
    @objc dynamic var photo96: String
    @objc dynamic var hasTags: Bool
    @objc dynamic var ownerID: Int
    @objc dynamic var photo3: String
    @objc dynamic var photo4, photo5, photo6: String?
   

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case height
        case photo130 = "photo"
        case id
        case photo75 = "photo_96"
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case photo3 = "photo_3"
        case photo4 = "photo_4"
        case photo5 = "photo_5"
        case photo6 = "photo_6"
       
    }
}
