//
//  PersistenceManager.swift
//  CoreDataSample
//
//  Created by Silvio Bulla on 05/11/2018.
//  Copyright © 2018 Silvio Bulla. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager {
    
    private init () {}
    static let shared = PersistenceManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
  
        let container = NSPersistentContainer(name: "CoreDataSample")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                
                try context.save()
                print("Saved successfully")
            } catch {
               
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        
        let entityName = String(describing: objectType)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

        do {
          let fetchObject = try context.fetch(fetchRequest) as? [T]
            
            return fetchObject ?? [T]()
        }catch {
            print(error)
            return [T]()
        }        
    }
    
    
    func delete(_ object: NSManagedObject){
        context.delete(object)
        save()
    }
}


