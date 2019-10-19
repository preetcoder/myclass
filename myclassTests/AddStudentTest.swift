//
//  AddStudentTest.swift
//  myclassTests
//
//  Created by Harpreet Singh on 15/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation
import XCTest
@testable import myclass

class AddStudentTest : XCTestCase {
    
    var studentmanager = StudentManager()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        testaddNewStudentTest()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testaddNewStudentTest()
    {
        // given
        let emailVal = "helloTest@test.com"
        let studentIDVal = "s3701661"
        let studentFirstName = "Preet"
        let studentLastName = "Singh"
        let studentPhone = "876787687"
        
        // When
        let studentData = studentmanager.saveStudentinDB(email: emailVal, studentID: studentIDVal, first_name: studentFirstName, last_name: studentLastName, phone: studentPhone)
        
        // Then
        XCTAssertTrue(studentData)
    }
}
