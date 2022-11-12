//
//  ViewController.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var idLabel: UILabel?
    @IBOutlet weak var urlLabel: UILabel?
    @IBOutlet weak var thumbnailUrlLabel: UILabel?
    @IBOutlet weak var albumIdLabel: UILabel?
    @IBOutlet var photoImage: UIImageView?
    
    var photo: PhotoModel?
    var vm: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel?.text = photo?.title
        idLabel?.text = String(photo?.id ?? 0)
        urlLabel?.text = photo?.url
        thumbnailUrlLabel?.text = photo?.thumbnailUrl
        albumIdLabel?.text = String(photo?.albumId ?? 0)
        
        guard let url = photo?.url else { return }
        APIManager.getImageFrom(url: url) { returnedImage in
            DispatchQueue.main.async {
                self.photoImage?.image = returnedImage
            }
        }
    }
 
    
    @IBAction func didPressFavoriteButton() {
        if let photo = photo {
            vm?.addPhotoToFavorites(photo: photo)
        }
        print("Button Pressed")
    }
}

