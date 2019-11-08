//
//  Mark+CoreDataClass.swift
//  myclass
//
//  Created by Bhavesh Hingad on 14/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


public class Mark: NSManagedObject {

    var getObtainedMarks :  Int {
        return Int(obtainedMarks)
    }
    var getID : Int {
           return Int(id)
       }
    
    var getAssessment : Assessment {
        return assessment!
    }
    
}
