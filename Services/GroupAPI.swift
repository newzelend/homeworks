//
//  GroupAPI.swift
//  vk_server
//
//  Created by Grisha Pospelov on 20.08.2021.
//

import Foundation
import Alamofire

struct Groups {
    
}

final class GroupAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"
    
    func getGroups (completion: @escaping([Groups]?)->()) {
        
        let method = "/groups.get"
        
      
        let parameters: Parameters = [
            "user_id": clientId,
            "access_token": Session.shared.token,
            "v": version,
            "extended": 1]
        
        
        let url = baseUrl + method
        
       
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print (response.result)
        }
    }
}

