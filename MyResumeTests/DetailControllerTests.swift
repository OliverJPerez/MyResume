//
//  DetailControllerTests.swift
//  MyResumeTests
//
//  Created by OliverPérez on 6/1/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import XCTest
@testable import MyResume

// MARK: ProfileControllerTests
class DetailControllerTests: XCTestCase {
    // MARK: - Unit Tests
    func testTitleExists() {
        // given
        let sut = DetailController.instantiate(from: Constants.StoryboardNames.main)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.titleLbl)
    }
    
    func testTextViewExists() {
        // given
        let sut = DetailController.instantiate(from: Constants.StoryboardNames.main)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.textContainer)
    }
}



