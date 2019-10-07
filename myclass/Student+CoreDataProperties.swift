//
//  Student+CoreDataProperties.swift
//  myclass
//
//  Created by Harpreet Singh on 7/10/19.
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
    @NSManaged public var attendance: NSSet?
    @NSManaged public var marks: NSSet?

}

// MARK: Generated accessors for attendance
extension Student {

    @objc(addAttendanceObject:)
    @NSManaged public func addToAttendance(_ value: Attendance)

    @objc(removeAttendanceObject:)
    @NSManaged public func removeFromAttendance(_ value: Attendance)

    @objc(addAttendance:)
    @NSManaged public func addToAttendance(_ values: NSSet)

    @objc(removeAttendance:)
    @NSManaged public func removeFromAttendance(_ values: NSSet)

}

// MARK: Generated accessors for marks
extension Student {

    @objc(addMarksObject:)
    @NSManaged public func addToMarks(_ value: Marks)

    @objc(removeMarksObject:)
    @NSManaged public func removeFromMarks(_ value: Marks)

    @objc(addMarks:)
    @NSManaged public func addToMarks(_ values: NSSet)

    @objc(removeMarks:)
    @NSManaged public func removeFromMarks(_ values: NSSet)

}
