//
//  Group_TableViewCell.swift
//  vk_server
//
//  Created by Grisha Pospelov on 23.08.2021.
//

import UIKit
import Alamofire


class Group_TableViewCell: UITableViewCell {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupMemebersCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ groupItem: GroupItem) {
        
        groupName.text = groupItem.name
        
        if let description = groupItem.groupDescription {
            groupDescription.text = description
        }
        
        groupMemebersCount.text =  "\(groupItem.membersCount.formatted) подписчиков"
        
        AF.request(groupItem.imageURL, method: .get).responseImage { response in
            guard let image = response.value else { return }
            self.groupImage.image = image
        }
    }
}

extension Int {
    var formatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "RU")
        
        let number = NSNumber(value: self)
        let formattedValue = formatter.string(from: number)!
        return "\(formattedValue)"
    }
}
