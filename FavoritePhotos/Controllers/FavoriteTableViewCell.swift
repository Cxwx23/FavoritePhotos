//
//  FavoriteTableViewCell.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var photoTitleLabel: UILabel?
    @IBOutlet weak var photoThumbnail: UIImageView?
    
    func setData(photo: Favorite?, vm: ViewModel) {
        guard let photo = photo else { return }
        self.photoTitleLabel?.text = photo.title
        setImage(from: photo, vm: vm)

    }
    
    func setImage(from photo: Favorite, vm: ViewModel) {
        vm.apiManager.getImageFrom(url: photo.thumbnailUrl) { returnedImage in
            DispatchQueue.main.async {
                guard let imageView = self.photoThumbnail else { return }
                imageView.layer.cornerRadius = imageView.frame.height / 2
                imageView.image = returnedImage
                self.clipsToBounds = true
            }
        }
    }
}
