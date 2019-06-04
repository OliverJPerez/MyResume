//
//  ExperienceViewUITests.swift
//  MyResumeUITests
//
//  Created by OliverPérez on 6/1/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import XCTest

// MARK: ExperienceViewUITests
class ExperienceViewUITests: XCTestCase {
    // MARK: - Properties
    let app = XCUIApplication()
    
    // MARK: - Set up
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    // MARK: - UITests
    func testNavigationBackButtonExists() {
        let app = XCUIApplication()
        app.tables.staticTexts["Experience"].tap()
        XCTAssertTrue(app.navigationBars["MyProfile"].buttons["MyProfile"].exists)
    }
    
    func testTableHaveAtLeastOneWorkPlace() {
        let app = XCUIApplication()
        app.tables.staticTexts["Experience"].tap()
        XCTAssertGreaterThanOrEqual(app.tables.cells.count, 1)
    }
}
