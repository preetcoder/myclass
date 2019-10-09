//
//  Mark+CoreDataProperties.swift
//  myclass
//
//  Created by Harpreet Singh on 9/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Mark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mark> {
        return NSFetchRequest<Mark>(entityName: "Mark")
    }

    @NSManaged public var id: Int32
    @NSManaged public var obtainedMarks: Int32
    @NSManaged public var assessment: Assessment?
    @NSManaged public var parentStudentMarks: Student?

}
