//
//  Marks.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation

struct Marks{
    
    private var id : Int
    private var assessment : Assessment
    private var obtainedMarks : Int
    
    // initializers
    init(marksID : Int, assessmentObj : Assessment, marksObtained : Int)
    {
        id = marksID
        assessment = assessmentObj
        obtainedMarks = marksObtained
    }
    
    func getAssessment() -> Assessment {
        return self.assessment
    }
    
    func getObtainedMarks() -> Int {
        return obtainedMarks
    }
    
    mutating func updateScore(score : Int)
    {
        self.obtainedMarks = score
    }
}
