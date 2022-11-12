//
//  PhotoModel.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import Foundation

/// Model built to consume data from the API
struct PhotoModel: Codable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
}
