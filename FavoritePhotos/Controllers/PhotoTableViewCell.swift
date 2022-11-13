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
    
    func setData(photo: PhotoModel?, vm: ViewModel) {
        guard let photo = photo, let url = photo.thumbnailUrl else { return }
        self.photoTitleLabel?.text = photo.title
        
        vm.apiManager.getImageFrom(url: url) { returnedImage in
            DispatchQueue.main.async {
                guard let image = self.photoThumbnail else { return }
                image.layer.cornerRadius = image.frame.height / 2
                image.image = returnedImage
                self.clipsToBounds = true

            }
        }
    }
}
