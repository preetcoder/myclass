//
//  Student.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation

class Student {
    
    // properties
    private var studentID : String
    private var first_name : String?
    private var last_name : String?
    private var email : String
    private var phone  : String?
    private var image : String?
    private var marks : [Marks]?
    private var attendance : [Attendance]?
    
    // initializer
    init(studentEmail : String, studentID : String, studentFirstName : String, studentLastName : String, studentPhone : String, studentImage : String) {
        self.email = studentEmail
        self.studentID = studentID
        self.first_name = studentFirstName
        self.last_name = studentLastName
        self.phone = studentPhone
        self.image = studentImage
    }
    
    func getStudentID() -> String {
       return  self.studentID
    }
    
    func getStudentName() -> String {
        return  "\(String(describing: self.first_name)) \(String(describing: self.last_name))"
    }
    
    
}
