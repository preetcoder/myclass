//
//  Assessment+CoreDataProperties.swift
//  myclass
//
//  Created by Bhavesh Hingad on 14/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Assessment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assessment> {
        return NSFetchRequest<Assessment>(entityName: "Assessment")
    }

    @NSManaged public var assessmentDate: Date?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var totalMarks: Int32
    @NSManaged public var singleMark: NSSet?

}

// MARK: Generated accessors for singleMark
extension Assessment {

    @objc(addSingleMarkObject:)
    @NSManaged public func addToSingleMark(_ value: Mark)

    @objc(removeSingleMarkObject:)
    @NSManaged public func removeFromSingleMark(_ value: Mark)

    @objc(addSingleMark:)
    @NSManaged public func addToSingleMark(_ values: NSSet)

    @objc(removeSingleMark:)
    @NSManaged public func removeFromSingleMark(_ values: NSSet)

}
