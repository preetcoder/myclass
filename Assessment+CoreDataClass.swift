//
//  Assessment+CoreDataClass.swift
//  myclass
//
//  Created by Bhavesh Hingad on 14/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//
//

import Foundation
import CoreData


public class Assessment: NSManagedObject {
    
    var getAssessmentTitle :  String {
              return "\(String(describing: name!))"
      }
      
      var getAssessmentMarks :  Int {
          return Int(totalMarks)
      }
      
      var  getAssessmentDate : Date {
          return assessmentDate! as Date
      }
      
      var getAssessmentID : Int {
          
          return Int(id)
      }
      
}
