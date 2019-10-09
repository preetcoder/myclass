//
//  Mark+CoreDataClass.swift
//  myclass
//
//  Created by Harpreet Singh on 9/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


public class Mark: NSManagedObject {

    var getObtainedMarks :  Int {
        return Int(obtainedMarks)
    }
    
}
