//
//  testingAddNewAssessment.swift
//  myclassUITests
//
//  Created by Bhavesh Hingad on 19/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import XCTest

class testDAddNewAssessment: XCTestCase {

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

    func testAddNewAssessment()
    {
        //Pre Condition: Application must be installed, Must be on Assessment Tab, Click on Add Button
        let validAssessmentName = "test"
        let validAssessmentMark = "10"
        
        let app = XCUIApplication()
        app.tabBars.buttons["Assessment"].tap()
        app.navigationBars["Assessments"].buttons["Add"].tap()
        
        //Action: Fill in assessment details and click on save
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
        
        //Result: A new Assessment with name test is created
        let assessmentCell = app.tables.staticTexts["test"]
        XCTAssertTrue(assessmentCell.exists)
    }

}
