//
//  PhotoAPI.swift
//  vk_server
//
//  Created by Grisha Pospelov on 20.08.2021.
//

import Foundation
import Alamofire

struct Photos {
    
}

final class PhotoAPI {
    
   
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"
    
    func getPhotos (completion: @escaping([Photos]?)->()) {
        
        let method = "/photos.getAll"
        
    
        let parameters: Parameters = [
            "owner_id": -1,
            "access_token": Session.shared.token,
            "v": version,
            "no_service_albums": 0,
            "count": 100,
            "extended": 1]
        
      
        let url = baseUrl + method
   
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print (response.result)
        }
    }
}
