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
    private var studentID : String?
    private var first_name : String?
    private var last_name : String?
    private var email : String?
    private var phone  : String?
    private var image : String?
    private var marks : [Marks]?
    private var attendance : [Attendance]?
    
    // initializer
    
    init() {
        
    }
    
    convenience init(studentEmail : String, studentID : String, studentFirstName : String, studentLastName : String, studentPhone : String, studentImage : String, studentAttendance : [Attendance]) {
        self.init()
        self.email = studentEmail
        self.studentID = studentID
        self.first_name = studentFirstName
        self.last_name = studentLastName
        self.phone = studentPhone
        self.image = studentImage
        self.attendance = studentAttendance
    }
    
    
    
    convenience init!(studentName : String, studentImage: String){
        self.init()
        self.first_name = studentName
        self.image = studentImage
    }
    
    
    
    
    
    
    func getStudentID() -> String {
       return  self.studentID!
    }
    
    func getStudentName() -> String {
        return  "\(String(describing: self.first_name!))"
    }
    
    func getStudentLastName() -> String {
        return  "\(String(describing: self.last_name!))"
    }
    
    func getStudentImage() -> String {
        return  "\(String(describing: self.image!))"
    }
    
    func getStudentEmail() -> String {
        return "\(String(describing:self.email!))"
    }
    
    func getStudentPhone() -> String {
        return "\(String(describing:self.phone!))"
    }
    
    func getAttendance() -> [Attendance]?
    {
       return self.attendance
    }
    
    // setters
    
    func setStudentFirstName(name : String) {
        self.first_name = name
    }
    
    func setStudentLastName(lastname : String) {
        self.last_name = lastname
    }
    
    func setStudentEmail(email : String) {
        self.email = email
    }
    
    func setStudentPhone(phone : String) {
        self.phone = phone
    }
    
    func addAttendance(attendanceObj : Attendance)
    {
        self.attendance?.append(attendanceObj)
    }
}
