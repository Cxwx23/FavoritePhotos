//
//  Favorite.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import CoreData

/// Class created manually for the NSManagedObject, Favorite.
@objc(Favorite)
class Favorite: NSManagedObject, Identifiable {
    
    @NSManaged var albumId: Int
    @NSManaged var id: Int
    @NSManaged var title: String
    @NSManaged var url: String
    @NSManaged var thumbnailUrl: String
    
    
    static func createWith(id: Int?, title: String?, url: String?, thumbnailUrl: String?, albumId: Int?, using context: NSManagedObjectContext) {
        
        let favorite = Favorite(context: context)
        favorite.id = id ?? 0
        favorite.title = title ?? ""
        favorite.albumId = albumId ?? 0
        favorite.thumbnailUrl = thumbnailUrl ?? ""
        favorite.url = url ?? ""
        
        PersistenceController.sharedController.save()
    }
    
    static func getFavoritesFrom(context: NSManagedObjectContext) -> [Favorite] {
        var favorites: [Favorite] = []
        
        let request = NSFetchRequest<Favorite>(entityName: "Favorite")
        
        do {
            favorites = try context.fetch(request)
        } catch let error {
            print("Error getting listItems \(error)")
        }

        return favorites
    }
    
    
//    static func removeFavorite(withId: Int?) {
//
//
//    }
    
}
