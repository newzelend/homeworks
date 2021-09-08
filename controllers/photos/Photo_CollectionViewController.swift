//
//  Photo_CollectionViewController.swift
//  vk_server
//
//  Created by Grisha Pospelov on 23.08.2021.
//

import UIKit
import Alamofire
import RealmSwift


class Photo_CollectionViewController: UICollectionViewController {

    var photoItems: [PhotoItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhotoAPI(Session.instance).get{ [weak self] photos in
            guard let self = self else { return }
            self.photoItems = photos!
            self.collectionView.reloadData()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell

        AF.request(photoItems[indexPath.row].photo604!, method: .get).responseImage { response in
            guard let image = response.value else { return }
            cell.photoView.image = image
        }
        
        return cell
    }
}
