//
//  AttendanceManager.swift
//  myclass
//
//  Created by Harpreet Singh on 9/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct AttendanceManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // method to add new attendance of student in DB
    
    func addNewAttendanceinDB(attendanceID: Int,attendanceDate: Date,attendanceStatus: Bool, studentObj : Student) -> Bool {
        
        let attendanceData = Attendance(context: context)
        
        attendanceData.id = Int32(attendanceID)
        attendanceData.attendaceDate = attendanceDate as NSDate
        
        attendanceData.parentStudentAttendance = studentObj
        
        attendanceData.status = attendanceStatus
        
        do{
            // save in db
            try self.context.save()
            return true
        }
        catch{
            print("error saving assessment \(error)")
        }
        
        
        
        return false
    }
    
    // method to get assessments
    mutating func getAttendanceRecords(StudObj : Student, lastVal : Bool) -> [Attendance] {
        
        var studentAttendance : [Attendance] = []
        
        let request : NSFetchRequest<Attendance> = Attendance.fetchRequest()
        
        if lastVal {
            
            // get last record for id
            let sort = NSSortDescriptor(key: "id", ascending: false)
            request.sortDescriptors = [sort]
            request.fetchLimit = 1
            
        }
        
        else{
            
            // get attendance of students based on student obj
            
            let studentPredicate = NSPredicate(format: "parentStudentAttendance.studentID MATCHES %@", StudObj.getStudentID)
            
            request.predicate = studentPredicate
        }
        
        
        do {
            // fetch from db
            studentAttendance =  try context.fetch(request)
            
        }catch{
            print("Error fetching Assessments \(error)")
        }
        
        return studentAttendance
        
    }
    
    mutating func getAttendanceRecord(StudObj : Student,attendanceDate: Date)->[Attendance]
    {
        var studentAttendance : [Attendance] = []
        let request : NSFetchRequest<Attendance> = Attendance.fetchRequest()
        let studentPredicate = NSPredicate(format: "attendaceDate = %@ and parentStudentAttendance.studentID MATCHES %@", attendanceDate as NSDate,StudObj.getStudentID)
        request.predicate = studentPredicate
        do {
            // fetch from db
            studentAttendance =  try context.fetch(request)
            
        }catch{
            print("Error fetching Assessments \(error)")
        }
        
        return studentAttendance
    }
    
    mutating func updateAttendanceRecord(StudObj : Student,attendanceDate: Date,attendanceStatus: Bool)-> Bool
    {
        var studentAttendance : [Attendance] = []
        let request : NSFetchRequest<Attendance> = Attendance.fetchRequest()
        let studentPredicate = NSPredicate(format: "attendaceDate = %@ and parentStudentAttendance.studentID MATCHES %@", attendanceDate as NSDate,StudObj.getStudentID)
        request.predicate = studentPredicate
        do {
            // fetch from db
            studentAttendance =  try context.fetch(request)
            
        }catch{
            print("Error fetching Assessments \(error)")
        }
        
        let attendanceObject = studentAttendance[0] as NSObject
        attendanceObject.setValue(attendanceStatus, forKey: "status")
        do{
            // save in db
            try self.context.save()
            return true
        }
        catch{
            print("error saving assessment \(error)")
        }
        return false
    }
}
