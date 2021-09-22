//
//  NewsItemPhotoTableViewCell.swift
//  vk_server
//
//  Created by Grisha Pospelov on 22.09.2021.
//

import UIKit
import Alamofire

class NewsItemPhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var feedItemPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(url: String? = nil, systemImageName: String? = nil) {
        
        if let systemImageName = systemImageName {
            feedItemPhoto.image = UIImage(named: systemImageName)
        } else {
            AF.request(url!, method: .get).responseImage { response in
                guard let image = response.value else { return }
                self.feedItemPhoto.image = image
            }
        }
    }
    
}
