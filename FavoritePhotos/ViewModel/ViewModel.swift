//
//  ViewModel.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import Foundation
import CoreData
import UIKit


class ViewModel {

    var photos: [PhotoModel]?
    var apiManager = APIManager()
    var context = PersistenceController.sharedController.container.viewContext
    var favorites: [Favorite]?
    
    init() {
        favorites = getFavorites()
        print(String(describing: favorites?[0].thumbnailUrl))
    }
    
    func getPhotoData(from dataUrl: String, table mainTableView: UITableView) {
        apiManager.getPhotosFrom(url: dataUrl) { returnedData in
            DispatchQueue.main.async {
                self.photos = returnedData
                mainTableView.reloadData()
            }
        }
    }
    
    func getPhotoDataForCell(row: Int?) -> PhotoModel? {
        guard let row = row, let photo = photos?[row] else { return nil }
        return photo
    }
    
    func addPhotoToFavorites(photo: PhotoModel) {
        Favorite.createWith(id: photo.id, title: photo.title, url: photo.url,
                            thumbnailUrl: photo.thumbnailUrl, albumId: photo.albumId,
                            using: context)
        
    }
    
    func getFavorites() -> [Favorite] {
        return Favorite.getFavoritesFrom(context: context)
    }
    
}
