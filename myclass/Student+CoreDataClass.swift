//
//  Student+CoreDataClass.swift
//  myclass
//
//  Created by Harpreet Singh on 7/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


public class Student: NSManagedObject {

    var getStudentID : String {
        return  self.studentID!
    }
    
    var getStudentName : String {
            return  "\(String(describing: self.first_name!))"
    }
    
    var getStudentLastName : String {
            return  "\(String(describing: self.last_name!))"
    }
    
    var getStudentImage : String {
            return  "\(String(describing: self.image!))"
    }
    
    var getStudentEmail : String {
            return "\(String(describing:self.email!))"
    }
    
    var getStudentPhone : String {
            return "\(String(describing:self.phone!))"
    }
    
}
