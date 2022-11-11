//
//  Favorite.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import CoreData

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
        do {
            try context.save()
            print("Saved Successfully")
        } catch {
            print("Error saving: \(title ?? "")")
        }
    }
    
    
    static func getFavoritesFromCoreData(context: NSManagedObjectContext) -> [Favorite] {
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
