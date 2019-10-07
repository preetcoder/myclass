//
//  Marks+CoreDataProperties.swift
//  myclass
//
//  Created by Harpreet Singh on 7/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Marks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Marks> {
        return NSFetchRequest<Marks>(entityName: "Marks")
    }

    @NSManaged public var id: Int32
    @NSManaged public var obtainedMarks: Int32
    @NSManaged public var assessment: Assessment?
    @NSManaged public var singleStudentMarks: Student?

}
