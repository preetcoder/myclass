//
//  Assessment.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation

class Assessment {
    
    private var id : Int?
    private var name : String?
    private var totalMarks : Int?
    private var assessmentDate : Date?
    
    init() {
    }
    
    // initializer
    init(assessmentId : Int, assessmentName : String, assessmentTotalMarks : Int, date : Date) {
        id = assessmentId
        name = assessmentName
        totalMarks = assessmentTotalMarks
        assessmentDate = date
        
    }
    
    func getAssessmentTitle() -> String {
        return "\(String(describing: self.name!))"
    }
    
    func getAssessmentMarks() -> Int {
        return self.totalMarks!
    }
    
    func getAssessmentDate() -> Date {
        return assessmentDate!
    }
    
     func setAssessmentTitle(assessmentName : String)
    {
        self.name = assessmentName;
    }
    
     func setAssessmentMarks(assessmentTotalMarks : Int) {
        self.totalMarks = assessmentTotalMarks;
    }
    
     func setAssessmentDate(date : Date)
    {
        self.assessmentDate = date;
    }
    
    func getAssessmentID() -> Int {
        return self.id!
    }
    
}
