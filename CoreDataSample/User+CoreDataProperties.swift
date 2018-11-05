//
//  User+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Silvio Bulla on 05/11/2018.
//  Copyright © 2018 Silvio Bulla. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?

}
