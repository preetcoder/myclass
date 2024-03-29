//
//  testAdddingNewStudent.swift
//  myclassUITests
//
//  Created by Bhavesh Hingad on 19/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import XCTest

class testAAddNewStudent: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddingNewStudent()
    {
        //Pre Condition: Application must be installed, Must be on Attendance Tab, Click on Add button
        let validFirstName = "test123"
        let validLastName = "test"
        let validStudentID = "S123"
        let validPhoneNo = "123456"
        let validEmail = "s123@gmai.com"
        
        let app = XCUIApplication()
    
        app.navigationBars["Attendance"].buttons["Add"].tap()
        
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        
        //Action: Add Student Details and click on save button
        let pleaseEnterNameTextField = elementsQuery.textFields["Please enter name"]
        XCTAssertTrue(pleaseEnterNameTextField.exists)
        pleaseEnterNameTextField.tap()
        pleaseEnterNameTextField.typeText(validFirstName)
        
        
        let pleaseEnterLastNameTextField = elementsQuery.textFields["Please enter last name"]
        pleaseEnterLastNameTextField.tap()
        pleaseEnterLastNameTextField.typeText(validLastName)
        
        let pleaseEnterStudentidTextField = elementsQuery.textFields["Please enter StudentID"]
        XCTAssertTrue(pleaseEnterStudentidTextField.exists)
        pleaseEnterStudentidTextField.tap()
        pleaseEnterStudentidTextField.typeText(validStudentID)
        
        let pleaseEnterEmailIDTextField = elementsQuery.textFields["Please enter email id"]
        XCTAssertTrue(pleaseEnterEmailIDTextField.exists)
        pleaseEnterEmailIDTextField.tap()
        pleaseEnterEmailIDTextField.typeText(validEmail)
        
        
        let pleaseEnterPhoneNumberTextField = elementsQuery.textFields["Please enter Phone number"]
        XCTAssertTrue(pleaseEnterPhoneNumberTextField.exists)
        pleaseEnterPhoneNumberTextField.tap()
        pleaseEnterPhoneNumberTextField.typeText(validPhoneNo)
        
        elementsQuery.buttons["Save"].tap()
        
        // Result: Student is added successfully
        let studentCell = app.tables.staticTexts["test123"]
        XCTAssertTrue(studentCell.exists)

    }

}
