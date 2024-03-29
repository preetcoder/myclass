//
//  testDeletingStudent.swift
//  myclassUITests
//
//  Created by Bhavesh Hingad on 19/10/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import XCTest

class testCDeleteStudent: XCTestCase {

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

    func testDeleteAddedStudent()
    {
        //Pre Condition: Application must be launch, you must be on Attendance Tab, and Student with student name test123test123 must exist
        let tablesQuery = XCUIApplication().tables
        //Action: Swipe Left and Click on Delete
        tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["test123test123"].swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        
        //Result: Student with name test123test123 must not exists
        let assessmentCell = tablesQuery.staticTexts["test123test123"]
        sleep(1)
        XCTAssertTrue(!assessmentCell.exists)
        
    }

}
