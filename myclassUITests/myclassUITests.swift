//
//  myclassUITests.swift
//  myclassUITests
//
//  Created by Harpreet Singh on 14/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import XCTest

class myclassUITests: XCTestCase {

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

    func testExample()
    {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testAddingNewStudent()
    {
        
        let validFirstName = "test123"
        let validLastName = "test"
        let validStudentID = "S123"
        let validPhoneNo = "123456"
        let validEmail = "s123@gmai.com"
        
        
        
        let app = XCUIApplication()
    
        app.navigationBars["Attendance"].buttons["Add"].tap()
        
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        
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
        let studentCell = app.tables.staticTexts["test123"]
        XCTAssertTrue(studentCell.exists)

    }
    
    func testEditingStudentDetails()
    {
        
        let validFirstName = "test123"
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["test123"].tap()
        
        let franNavigationBar = app.navigationBars["test123"]
        franNavigationBar.buttons["Edit"].tap()
        
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
        let studentcell = tablesQuery.staticTexts["test123test123"]
        XCTAssertTrue(studentcell.exists)
    }
    
    
    func testAddNewAssessment()
    {
        let validAssessmentName = "test"
        let validAssessmentMark = "10"
        
        let app = XCUIApplication()
        app.tabBars.buttons["Assessment"].tap()
        app.navigationBars["Assessments"].buttons["Add"].tap()
        
        
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        
        let assessmentNameTextField = elementsQuery.textFields["Assessment description"]
        XCTAssertTrue(assessmentNameTextField.exists)
        assessmentNameTextField.tap()
        assessmentNameTextField.typeText(validAssessmentName)
        
        let totalMarksTextField = elementsQuery.textFields["Total marks"]
        XCTAssertTrue(totalMarksTextField.exists)
        totalMarksTextField.tap()
        totalMarksTextField.typeText(validAssessmentMark)
        

        elementsQuery.datePickers.pickerWheels["Today"].tap()
        scrollViewsQuery.otherElements.containing(.textField, identifier:"Assessment description").element.tap()
        
        elementsQuery.buttons["Save"].tap()
        
        let assessmentCell = app.tables.staticTexts["test"]
        XCTAssertTrue(assessmentCell.exists)
    }
    
    func testReadAddedAssessment()
    {
        
                
        let validAssessmentName = "test"
        let validAssessmentMark = "10"
        
        let app = XCUIApplication()
        app.tabBars.buttons["Assessment"].tap()
        app.navigationBars["Assessments"].buttons["Add"].tap()
        
        
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        
        let assessmentNameTextField = elementsQuery.textFields["Assessment description"]
        XCTAssertTrue(assessmentNameTextField.exists)
        assessmentNameTextField.tap()
        assessmentNameTextField.typeText(validAssessmentName)
        
        let totalMarksTextField = elementsQuery.textFields["Total marks"]
        XCTAssertTrue(totalMarksTextField.exists)
        totalMarksTextField.tap()
        totalMarksTextField.typeText(validAssessmentMark)
        

        elementsQuery.datePickers/*@START_MENU_TOKEN@*/.pickerWheels["Today"]/*[[".pickers.pickerWheels[\"Today\"]",".pickerWheels[\"Today\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        scrollViewsQuery.otherElements.containing(.textField, identifier:"Assessment description").element.tap()
        
        elementsQuery.buttons["Save"].tap()
        
        let assessmentCell = app.tables.staticTexts["test"]
        XCTAssertTrue(assessmentCell.exists)
    }
    
}
