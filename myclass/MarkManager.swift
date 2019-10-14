//
//  MarkManager.swift
//  myclass
//
//  Created by Bhavesh Hingad on 13/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation
import UIKit
import CoreData
struct MarkManager
{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // This function is used to add new marks
    func addNewMark(markID: Int, obtainedMark: Int, assessmentObj : Assessment, studentObj: Student) ->Bool
    {
        let markData =  Mark(context: context)
        markData.id = Int32(markID)
        markData.obtainedMarks =  Int32(obtainedMark)
        markData.parentStudentMarks = studentObj
        markData.assessment = assessmentObj
        
        do
        {
            try self.context.save()
            return true
        }
        catch
        {
            print("error saving mark \(error)")
        }
        return false
    }
    
    //This function is used to update the student marks
    mutating func updateMark(obtainedMark: Int, assessmentObj : Assessment, studentObj: Student)->Bool
    {
        //define empty array
        var studentMark : [Mark] = []
        //define request type
        let request : NSFetchRequest<Mark> = Mark.fetchRequest()
        
        // find mark record with studentid and assessment id
        let studentMarkPredicate = NSPredicate(format: "parentStudentMarks.studentID MATCHES %@ and assessment.id = %@", studentObj.getStudentID,NSNumber(integerLiteral: assessmentObj.getAssessmentID))
       
        //add the predicate to the request
        request.predicate = studentMarkPredicate
        do
        {
            //fetch the records
            studentMark = try context.fetch(request)
        }
        catch
        {
            //print error if issues in fetching the record
            print("Error fetching Mark \(error)")
        }
        
        // since only one record will be there always we will update the first record
        let markObject = studentMark[0] as NSObject
        //update the value
        markObject.setValue(obtainedMark, forKey: "obtainedMarks")
        markObject.setValue(assessmentObj, forKey: "assessment")
        do
        {
            // save the object
            try self.context.save()
            return true
        }
        catch
        {
            print("Error saving mark \(error)")
        }
        return false
    }
    
    //This function is used to get student maark
    mutating func getStudentMark(assessmentObj : Assessment, studentObj: Student)->[Mark]
    {
        //define empty array
        var studentMark : [Mark] = []
        //define request type
        let request : NSFetchRequest<Mark> = Mark.fetchRequest()
        
        // find mark record with studentid and assessment id
        let studentMarkPredicate = NSPredicate(format: "parentStudentMarks.studentID MATCHES %@ and assessment.id = %@", studentObj.getStudentID,NSNumber(integerLiteral: assessmentObj.getAssessmentID))
       
        //add the predicate to the request
        request.predicate = studentMarkPredicate
        do
        {
            //fetch the records
            studentMark = try context.fetch(request)
        }
        catch
        {
            //print error if issues in fetching the record
            print("Error fetching Mark \(error)")
        }
        return studentMark
    }
    
    // method to get assessments
    mutating func getLastRecord() -> [Mark]
    {
        //define empty array
        var studentMark : [Mark] = []
        //define request type
        let request : NSFetchRequest<Mark> = Mark.fetchRequest()
        // get last record for id
        let sort = NSSortDescriptor(key: "id", ascending: false)
        request.sortDescriptors = [sort]
        request.fetchLimit = 1
        do
        {
            //fetch the records
            studentMark = try context.fetch(request)
        }
        catch
        {
            //print error if issues in fetching the record
            print("Error fetching Mark \(error)")
        }
        return studentMark
    }
}
