//
//  Marks+CoreDataClass.swift
//  myclass
//
//  Created by Harpreet Singh on 7/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


public class Marks: NSManagedObject {

    var getObtainedMarks :  Int {
        return Int(obtainedMarks)
    }
    
}
