//
//  custom.swift
//  vk_server
//
//  Created by Grisha Pospelov on 23.08.2021.

import UIKit

class custom: UIImageView {
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.bounds.width / 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
    
    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.75,
                                    delay: 0,
                                    usingSpringWithDamping: 0.25,
                                    initialSpringVelocity: 0.75,
                                    options: [.allowUserInteraction],
                                    animations: {
                                        self.bounds = self.bounds.insetBy(dx: 20, dy: 20)
                                    },
                                    completion: nil)
    }
}
