//
//  Attendance+CoreDataProperties.swift
//  myclass
//
//  Created by Harpreet Singh on 9/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Attendance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Attendance> {
        return NSFetchRequest<Attendance>(entityName: "Attendance")
    }

    @NSManaged public var attendaceDate: NSDate?
    @NSManaged public var id: Int32
    @NSManaged public var status: Bool
    @NSManaged public var parentStudentAttendance: Student?

}
