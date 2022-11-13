//
//  Literals.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import Foundation



enum Id: String {
    case detailSegue = "photoDetailSegue"
    case favoritesSegue = "favoritesSegue"
    case photoCell = "photoCell"
    case favoriteCell = "favoriteCell"
}

enum Url: String {
    case photoApi = "https://jsonplaceholder.typicode.com/photos"
}
