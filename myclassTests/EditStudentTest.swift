//
//  EditStudentTest.swift
//  myclassTests
//
//  Created by Harpreet Singh on 19/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import XCTest
@testable import myclass

class EditStudentTest: XCTestCase {
    
    
    // precondition
    var studentmanager = StudentManager()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    
        // main execute
        testEditStudent()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEditStudent() {
        // Given
        let newFirstName = "PrTest"
        let newLastName = "PrLastName"
        var EditStudStatus = false
        addNewStudenttoEdit()
        
        // get student Object
        let getUserWithStudID = studentmanager.getSingleStudentfromDB(studentID: "s3701661")
        
        // When
        if getUserWithStudID != nil {
            EditStudStatus = studentmanager.updateStudentRecordinDB(studentObj: getUserWithStudID!, emailVal: getUserWithStudID!.getStudentEmail, studentIDVal: getUserWithStudID!.getStudentID, first_nameVal: newFirstName, last_nameVal: newLastName, phoneVal: getUserWithStudID!.getStudentPhone, imageVal: getUserWithStudID!.getStudentImage)
        }
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Then
        // Result:  Edit student successfully
        XCTAssertTrue(EditStudStatus)
        
    }

    // method as precondition to add student before deleting
    func addNewStudenttoEdit(){
        
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
