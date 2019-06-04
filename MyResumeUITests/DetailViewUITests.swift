//
//  DetailViewUITests.swift
//  MyResumeUITests
//
//  Created by OliverPérez on 6/1/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import XCTest

// MARK: DetailViewUITests
class DetailViewUITests: XCTestCase {
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
        app.tables.staticTexts["About"].tap()
        XCTAssertTrue(app.navigationBars["MyProfile"].buttons["MyProfile"].exists)
    }
    
    func testHasTitleLabel() {
        let app = XCUIApplication()
        app.tables.staticTexts["About"].tap()
        XCTAssertTrue(app.staticTexts["TitleLabel"].exists)
    }
    
    func testHasSummaryTextView() {
        let app = XCUIApplication()
        app.tables.staticTexts["About"].tap()
        XCTAssertTrue(app.textViews["Summary"].exists)
    }
}
