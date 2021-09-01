//
//  PhotoDB.swift
//  vk_server
//
//  Created by Grisha Pospelov on 31.08.2021.
//

import Foundation
import RealmSwift



class PhotoDB {

     let config = Realm.Configuration(schemaVersion: 0)
     lazy var mainRealm = try! Realm(configuration: config)
     var photos: [Photo] = []
    
    
     func addData(_ user: [Photo]) {
        mainRealm.beginWrite()
        photos = user
        let photo = Photo()
        let e = self.photos.count
        var i = 0
        while i < e {
            photo.id = self.photos[i].id
            photo.photo130 = self.photos[i].photo130
            mainRealm.add(user)
            i = i + 1
        }
        do {
            try mainRealm.commitWrite()
        } catch {
            print(error.localizedDescription)
        }

     }
    func fetch() -> [Photo] {

             //Прочитать объекты
             let users = mainRealm.objects(Photo.self)
             print(mainRealm.configuration.fileURL)
             return Array(users)
         }
 }

