//
//  Attendance+CoreDataClass.swift
//  myclass
//
//  Created by Harpreet Singh on 7/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


public class Attendance: NSManagedObject {

    
    var getID : Int {
        return Int(id)
    }
    
    var getDate : Date {
        return attendaceDate! as Date
    }
    
    var getStatus : Bool {
            return status
    }
    
}
