//
//  FriendAPI.swift
//  vk_server
//
//  Created by Grisha Pospelov on 19.08.2021.

import Foundation
import Alamofire

struct Users {

}

final class FriendAPI {

    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"

    func getFriends (completion: @escaping([User]?)->()) {

        let method = "/friends.get"

        // параметры
        let parameters: Parameters = [
            "user_id": clientId,
            "order": "name",
            "count": 100,
            "fields": "photo_100",
            "access_token": Session.shared.token,
            "v": version]

       
        let url = baseUrl + method

        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in

            print (response.result)
        }
    }
}

