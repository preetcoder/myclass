//
//  StudentManager.swift
//  myclass
//
//  Created by Harpreet Singh on 8/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct StudentManager {
    
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
     var allStudent : [Student] = []
    
    var singleStudent : Student?
    
    func saveStudentinDB(email : String, studentID : String, first_name : String, last_name : String, phone : String, image : String = "download") -> Bool {
        
        let studentData = Student(context: self.context)
        
        studentData.email = email
        
        studentData.studentID = studentID
        
        studentData.first_name = first_name
        
        studentData.last_name = last_name
        
        studentData.phone = phone
        
        studentData.image = image
        
       // studentData.attendance = []
        
        do{
            // save in db
            try self.context.save()
            return true
        }
        catch{
            print("error saving students \(error)")
        }
        
        return false
    }
    
    // method to get students from db
    mutating func getStudentsfromDB() -> [Student]{
        
        let request : NSFetchRequest<Student> = Student.fetchRequest()
        let sort = NSSortDescriptor(key: "self", ascending: false)
        request.sortDescriptors = [sort]
        
        do {
            // fetch from db
            allStudent =  try context.fetch(request)
            
        }catch{
            print("Error fetching students \(error)")
        }
        
        
        
        return allStudent
        
    }
    
    //method to get single student from DB
    mutating func getSingleStudentfromDB(studentID : String) -> Student? {
      
       
        let request : NSFetchRequest<Student> = Student.fetchRequest()

        let studentPredicate = NSPredicate(format: "studentID = %@", studentID)
        request.predicate = studentPredicate

        var allStudentswithCondition : [Student] = []

        do {
            // fetch from db
            allStudentswithCondition =  try context.fetch(request)



        }catch{
            print("Error fetching Student \(error)")
        }

        if allStudentswithCondition.count > 0 {
            // only 1 user if found because student ID is unique
            singleStudent = allStudentswithCondition[0]
        }
        return singleStudent
    }
    
    
    // method to check if student entity has data
    func checkifStudentsExistsinDB() -> Bool{
        
        let request : NSFetchRequest<Student> = Student.fetchRequest()
        
        let count : Int
        do {
            count = try context.count(for: request)
            // condition to go out
            if(count > 0){
                return true
            }
            
        }
        catch{
            print("Error fetching students count \(error)")
        }
        return false
        
    }
    
    // method for updating
    
    func updateStudentRecordinDB(studentObj : NSManagedObject ,emailVal: String, studentIDVal: String , first_nameVal: String, last_nameVal: String, phoneVal: String, imageVal: String) -> Bool {
        
        studentObj.setValue(emailVal, forKey: "email")
        studentObj.setValue(studentIDVal, forKey: "studentID")
        studentObj.setValue(first_nameVal, forKey: "first_name")
        studentObj.setValue(last_nameVal, forKey: "last_name")
        studentObj.setValue(phoneVal, forKey: "phone")
        studentObj.setValue(imageVal, forKey: "image")
        
        
        do{
            // update in db
            try self.context.save()
            return true
        }
        catch{
            print("error saving students \(error)")
        }
        
        return false;
        
    }
    
    // method for delete student
    
    func deleteStudentRecordinDB(studentObj : NSManagedObject) -> Bool{
     
        context.delete(studentObj)
        
        do{
            // update in db
            try self.context.save()
            return true
        }
        catch{
            print("error saving students \(error)")
        }
        
        return false
    }
    
}
