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
    var context = PersistenceController.sharedController.context
    var favorites: [Favorite]?
    
    init() {
        favorites = getFavorites()
    }
    
    func getPhotoData(from dataUrl: String, table tableView: UITableView) {
        apiManager.getPhotosFrom(url: dataUrl) { returnedData in
            DispatchQueue.main.async {
                self.photos = returnedData
                tableView.reloadData()
            }
        }
    }
    
    func getDataForPhotoCell(row: Int?) -> PhotoModel? {
        guard let row = row, let photo = photos?[row] else { return nil }
        return photo
    }

    func getDataForFavoriteCell(row: Int?) -> Favorite? {
        guard let row = row, let photo = favorites?[row] else { return nil }
        return photo
    }
    
    func addPhotoToFavorites(photo: PhotoModel) {
        Favorite.createWith(id: photo.id, title: photo.title, url: photo.url,
                            thumbnailUrl: photo.thumbnailUrl, albumId: photo.albumId,
                            using: context)
        favorites = getFavorites()
        
    }
    
    func getFavorites() -> [Favorite] {
        return Favorite.getFavoritesFrom(context: context)
    }
    
}
