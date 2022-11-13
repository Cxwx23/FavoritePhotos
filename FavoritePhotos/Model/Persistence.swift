//
//  PersistenceController.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import Foundation
import CoreData

struct Persistence {
    
    static let shared = Persistence()
    let container: NSPersistentContainer
    var context: NSManagedObjectContext
    
    init(inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: "CoreDataModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        
        container.loadPersistentStores { _, error in
            if let error = error {
                print("ERROR LOADING COREDATA \(error)")
            } else {
                print("CoreData Loaded Successfully")
            }
        }
        
        context = container.viewContext
        SetUpContext()
        
    }
    
    mutating func SetUpContext() {
        context.automaticallyMergesChangesFromParent = true
        context.name = "viewContext"
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        context.undoManager = nil
        context.shouldDeleteInaccessibleFaults = true
    }
    

    func save() {
        do {
            try context.save()
            print("Saved Successfully")
        } catch let error {
            print("ERROR SAVING TO COREDATA \(error)")
        }
    }
    
}
