//
//  AssessmentManager.swift
//  myclass
//
//  Created by Harpreet Singh on 9/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct AssessmentManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var allAssessments : [Assessment] = []
    
    // method to add new Assessment
    func addNewAssessment(assessmentID : Int, assessmentTitle : String, assessmentTotalmarks : Int, assessmentDate : Date) -> Bool{
        
        let assessmentData = Assessment(context: context)
        
        assessmentData.assessmentDate = assessmentDate as Date
        assessmentData.totalMarks = Int32(assessmentTotalmarks)
        assessmentData.name = assessmentTitle
        assessmentData.id = Int32(assessmentID)
        
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
    mutating func getAssessmentRecords(lastVal : Bool) -> [Assessment] {
        
        let request : NSFetchRequest<Assessment> = Assessment.fetchRequest()
        
        if lastVal {
            
            // get last record
            let sort = NSSortDescriptor(key: "id", ascending: false)
            request.sortDescriptors = [sort]
            request.fetchLimit = 1
        }
        
        do {
            // fetch from db
            allAssessments =  try context.fetch(request)
            
        }catch{
            print("Error fetching Assessments \(error)")
        }
        
        
        return allAssessments
        
    }
    
    // method to update assessment
    func updateAssessmentinDB(assessmentObj : NSManagedObject, assessmentTitle : String, assessmentTotalmarks : Int, assessmentDate : Date) -> Bool{
        
        assessmentObj.setValue(assessmentTitle, forKey: "name")
        assessmentObj.setValue(Int32(assessmentTotalmarks), forKey: "totalMarks")
        assessmentObj.setValue(assessmentDate, forKey: "assessmentDate")
       
        
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
    
    // method for delete assessment in DB
    
    func deleteAssessmentinDB(assessmentObj : NSManagedObject) -> Bool{
        context.delete(assessmentObj)
        
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
