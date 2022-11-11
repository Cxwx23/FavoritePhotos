//
//  ViewModel.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import Foundation
import CoreData


class ViewModel {
    
    var context = PersistenceController.sharedInstance.context
    
    func getPhotoData(dataURL: String, completionHandler: @escaping ([PhotoModel]) -> Void) {
        APIManager.getDataFrom(url: dataURL) { returnedData in
            DispatchQueue.main.async {
                completionHandler(returnedData)
            }
        }
    }
    
    
    func addPhotoToFavorites(photo: PhotoModel) {
        Favorite.createWith(id: photo.id, title: photo.title, url: photo.url,
                            thumbnailUrl: photo.thumbnailUrl, albumId: photo.albumId,
                            using: context)
    }

    
    
}
