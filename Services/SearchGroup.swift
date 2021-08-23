//
//  SearchGroup.swift
//  vk_server
//
//  Created by Grisha Pospelov on 20.08.2021.
//

import Foundation
import Alamofire

struct SearchGroups {
    
}

final class SearchGroupAPI {
    
 
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"
    
    func getSearchGroups (completion: @escaping([SearchGroups]?)->()) {
        
        let method = "/groups.search"
        
     
        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "v": version,
            "q": "searchText"]
        
        
        let url = baseUrl + method
        

        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print (response.result)
        }
    }
}
