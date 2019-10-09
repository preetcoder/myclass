//
//  Student+CoreDataProperties.swift
//  myclass
//
//  Created by Harpreet Singh on 9/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var email: String?
    @NSManaged public var first_name: String?
    @NSManaged public var image: String?
    @NSManaged public var last_name: String?
    @NSManaged public var phone: String?
    @NSManaged public var studentID: String?
    @NSManaged public var attendances: NSSet?
    @NSManaged public var marks: NSSet?

}

// MARK: Generated accessors for attendances
extension Student {

    @objc(addAttendancesObject:)
    @NSManaged public func addToAttendances(_ value: Attendance)

    @objc(removeAttendancesObject:)
    @NSManaged public func removeFromAttendances(_ value: Attendance)

    @objc(addAttendances:)
    @NSManaged public func addToAttendances(_ values: NSSet)

    @objc(removeAttendances:)
    @NSManaged public func removeFromAttendances(_ values: NSSet)

}

// MARK: Generated accessors for marks
extension Student {

    @objc(addMarksObject:)
    @NSManaged public func addToMarks(_ value: Mark)

    @objc(removeMarksObject:)
    @NSManaged public func removeFromMarks(_ value: Mark)

    @objc(addMarks:)
    @NSManaged public func addToMarks(_ values: NSSet)

    @objc(removeMarks:)
    @NSManaged public func removeFromMarks(_ values: NSSet)

}
