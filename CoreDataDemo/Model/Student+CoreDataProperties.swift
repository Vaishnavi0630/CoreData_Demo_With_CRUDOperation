//
//  Student+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Vaishnavi Sasane on 26/06/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var mobile: String?

}
