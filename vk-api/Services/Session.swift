//
//  Session.swift
//  vk_server
//
//  Created by Grisha Pospelov on 19.08.2021.
//

import Foundation

final class Session {
    
    static let shared = Session()
    
    private init() {}
    
    var token = ""
    var userId = ""
}
