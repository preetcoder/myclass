//
//  Assessment+CoreDataProperties.swift
//  myclass
//
//  Created by Harpreet Singh on 7/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Assessment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assessment> {
        return NSFetchRequest<Assessment>(entityName: "Assessment")
    }

    @NSManaged public var assessmentDate: NSDate?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var totalMarks: Int32
    @NSManaged public var singleMark: Marks?

}
