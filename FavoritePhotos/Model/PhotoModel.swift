//
//  PhotoModel.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import Foundation

protocol Photo { }

/// Model built to consume data from the API
struct PhotoModel: Codable, Photo {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
}
