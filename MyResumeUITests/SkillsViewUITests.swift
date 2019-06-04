//
//  SkillsViewUITests.swift
//  MyResumeUITests
//
//  Created by OliverPérez on 6/1/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import XCTest

// MARK: SkillsViewUITests
class SkillsViewUITests: XCTestCase {
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
        app.tables.staticTexts["Hard Skills"].tap()
        XCTAssertTrue(app.navigationBars["MyProfile"].buttons["MyProfile"].exists)
    }
    
    func testTableHaveAtLeastOneSkill() {
        let app = XCUIApplication()
        app.tables.staticTexts["Hard Skills"].tap()
        XCTAssertGreaterThanOrEqual(app.tables.cells.count, 1)
    }
}
