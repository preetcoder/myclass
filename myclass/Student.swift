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
    
    convenience init(studentEmail : String, studentID : String, studentFirstName : String, studentLastName : String, studentPhone : String, studentImage : String, studentAttendance : [Attendance], studentMarks : [Marks]) {
        self.init()
        self.email = studentEmail
        self.studentID = studentID
        self.first_name = studentFirstName
        self.last_name = studentLastName
        self.phone = studentPhone
        self.image = studentImage
        self.attendance = studentAttendance
        self.marks = studentMarks
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
    
    func getMarks() -> [Marks]?
    {
        return self.marks
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
    
    func setStudentImage(image : String){
        self.image = image
    }
    
    func addAttendance(attendanceObj : Attendance)
    {
        self.attendance?.append(attendanceObj)
    }
    
    func updateAttendance(position : Int, state : Bool)
    {
        self.attendance![position].updateStatus(Status: state)
    }
    
    func updateMarks(position : Int, score : Int)
    {
        self.marks![position].updateScore(score: score)
    }
    
    func addMarks(scores :  Marks){
        self.marks?.append(scores)
    }
}
