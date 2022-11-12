//
//  PhotoTableViewCell.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoTitleLabel: UILabel?
    @IBOutlet weak var photoThumbnail: UIImageView?
    
    func setData(photo: PhotoModel?) {
        guard let photo = photo, let url = photo.thumbnailUrl else { return }
        self.photoTitleLabel?.text = photo.title
        
        APIManager.getImageFrom(url: url) { returnedImage in
            DispatchQueue.main.async {
                self.photoThumbnail?.image = returnedImage
            }
        }
    }
}
