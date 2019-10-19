//
//  AddNewAssessment.swift
//  myclassTests
//
//  Created by Harpreet Singh on 18/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import XCTest
@testable import myclass

class AddNewAssessment: XCTestCase {
    
    let assessmentmanager = AssessmentManager()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        testaddNewAssessmentTest()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testaddNewAssessmentTest() {
        
        //Given
        let testAssessmentID = 100
        let testAssessmentTitle = "testAssessment"
        let testAssessmentTotalMarks = 10
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let testAssessmentDate = formatter.date(from: "2019/10/08 22:30")
        
        // When
        let assessmentStatus = assessmentmanager.addNewAssessment(assessmentID: testAssessmentID, assessmentTitle: testAssessmentTitle, assessmentTotalmarks: testAssessmentTotalMarks, assessmentDate: testAssessmentDate!)
        
        // Then
        // if test passes, Assessment added successfully
        XCTAssertTrue(assessmentStatus)
        
    }


}
