//
//  User_ViewController.swift
//  vk_server
//
//  Created by Grisha Pospelov on 23.08.2021.
//

import UIKit
import Alamofire
import AlamofireImage


class User_ViewController: UIViewController {

    @IBOutlet weak var userImage: custom!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserAPI(Session.instance).get{ user in

            guard let user = user else { return }
            self.userName.text = "\(user.firstName) \(user.lastName)"
            //self.userLocation.text = "\(user.city), \(user.country)."

            if let imageURL = user.imageURL {
                AF.request(imageURL, method: .get).responseImage { response in
                    guard let image = response.value else { return }
                    self.userImage.image = image
                }
            }
        }
    }
}
