//
//  testEditingStudentDetails.swift
//  myclassUITests
//
//  Created by Bhavesh Hingad on 19/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import XCTest

class testBEditStudent: XCTestCase {

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

    func testEditingStudentDetails()
    {
        //Pre Condition: Application must be installed, Must be on Attendance Tab, Student with name test123 must exists, Click on test123
        let validFirstName = "test123"
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["test123"].tap()
        
        let franNavigationBar = app.navigationBars["test123"]
        franNavigationBar.buttons["Edit"].tap()
        
        //Action: change the name of the student to test123test123
        let elementsQuery = app.scrollViews.otherElements
        let firstNameTextField = elementsQuery.textFields["First Name"]
        XCTAssertTrue(firstNameTextField.exists)
        firstNameTextField.tap()
        firstNameTextField.typeText(validFirstName)
        
        let lastNameTextField = elementsQuery.textFields["Last Name"]
        lastNameTextField.tap()
        lastNameTextField.tap()
        elementsQuery.textFields["Phone"].tap()
        elementsQuery.textFields["StudentID"].tap()
        elementsQuery.textFields["Email"].tap()
        elementsQuery.buttons["Save"].tap()
        
        //Result: Student Name is Updated
        let studentcell = tablesQuery.staticTexts["test123test123"]
        XCTAssertTrue(studentcell.exists)
    }

}
