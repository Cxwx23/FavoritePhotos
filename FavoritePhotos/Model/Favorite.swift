//
//  Favorite.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import CoreData

/// Class created manually for the NSManagedObject, Favorite.
@objc(Favorite)
class Favorite: NSManagedObject, Identifiable, Photo {
    
    @NSManaged var albumId: Int
    @NSManaged var id: Int
    @NSManaged var title: String
    @NSManaged var url: String
    @NSManaged var thumbnailUrl: String
    
    static func createWith(photo: PhotoModel) {
        let favorite = Favorite(context: Persistence.shared.context)
        favorite.id = photo.id ?? 0
        favorite.title = photo.title ?? ""
        favorite.albumId = photo.albumId ?? 0
        favorite.thumbnailUrl = photo.thumbnailUrl ?? ""
        favorite.url = photo.url ?? ""

        Persistence.shared.save()
    }
    
    static func getFavorites(from context: NSManagedObjectContext) -> [Favorite] {
        var favorites: [Favorite] = []
        
        let request = NSFetchRequest<Favorite>(entityName: "Favorite")
        
        do {
            favorites = try context.fetch(request)
        } catch let error {
            print("Error getting listItems \(error)")
        }

        return favorites
    }

    
}
