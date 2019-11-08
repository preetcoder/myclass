//
//  DeleteStudentTest.swift
//  myclassTests
//
//  Created by Harpreet Singh on 19/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import XCTest
@testable import myclass

class DeleteStudentTest: XCTestCase {
    
    // preconditions
    var studentmanager = StudentManager()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        
        
        // main execute
        testDeleteStudent()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDeleteStudent() {
        
        // preconditions - Add and get student first
        var deleteStudStatus = false
        // Given
        addNewStudenttoDelete()
        
        // get student Object
        let getUserWithStudID = studentmanager.getSingleStudentfromDB(studentID: "s3701661")
        
        // When
        if getUserWithStudID != nil {
            deleteStudStatus = studentmanager.deleteStudentRecordinDB(studentObj: getUserWithStudID!)
        }
        
        
        // Then
        // Result:  delete student successfully
        XCTAssertTrue(deleteStudStatus)
        
    }
    
    // method as precondition to add student before deleting
    func addNewStudenttoDelete(){
        
        // given
        let emailVal = "helloTest@test.com"
        let studentIDVal = "s3701661"
        let studentFirstName = "Preet"
        let studentLastName = "Singh"
        let studentPhone = "876787687"
        
        // When
        let studentData = studentmanager.saveStudentinDB(email: emailVal, studentID: studentIDVal, first_name: studentFirstName, last_name: studentLastName, phone: studentPhone)
        
    }
    
    
}
