//
//  NewsItemTextTableViewCell.swift
//  vk_server
//
//  Created by Grisha Pospelov on 22.09.2021.
//

import UIKit

class NewsItemTextTableViewCell: UITableViewCell {
    
    @IBOutlet weak var feedItemText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(text: String?) {
        feedItemText.text = text
    }

}
