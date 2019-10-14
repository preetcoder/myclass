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
    
    func addNewStudentTest(){
        
        // add student parameter
        let studentData = studentmanager.saveStudentinDB(email: "helloTest@test.com", studentID: "s3701661", first_name: "Preet", last_name: "Singh", phone: "876787687")
        
        // check status. must be true as value are correct
        XCTAssertTrue(studentData)
    }
}
