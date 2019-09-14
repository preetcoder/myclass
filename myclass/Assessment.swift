//
//  Assessment.swift
//  myclass
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation

struct Assessment {
    
    private var id : Int
    private var name : String
    private var totalMarks : Int
    
    // initializer
    init(assessmentId : Int, assessmentName : String, assessmentTotalMarks : Int) {

        id = assessmentId
        name = assessmentName
        totalMarks = assessmentTotalMarks
        
    }
}
