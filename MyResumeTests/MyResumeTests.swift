//
//  MyResumeTests.swift
//  MyResumeTests
//
//  Created by OliverPérez on 6/1/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import XCTest
@testable import MyResume

// MARK: ProfileControllerTests
class ProfileControllerTests: XCTestCase {
    // MARK: - Unit Tests
    func testProfileSectionTableExists() {
        // given
        let sut = ProfileController.instantiate(from: Constants.StoryboardNames.main)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.sectionsTable)
    }
    
    func testProfileSectionTableHaveCorrectRowCount() {
        // given
        let sut = ProfileController.instantiate(from: Constants.StoryboardNames.main)
        let dummySection = Section(title: "", summary: nil, workPlaces: nil, skills: nil)
        
        // when
        sut.loadView()
        sut.sections = [Section](repeating: dummySection, count: 5)
        
        // then
        let rowCount = sut.tableView(sut.sectionsTable, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, sut.sections.count)
    }
    
    func testProfileSectionTableCellHaveCorrectTitle() {
        // given
        let sut = ProfileController.instantiate(from: Constants.StoryboardNames.main)
        let dummySection = Section(title: "Section Title", summary: nil, workPlaces: nil, skills: nil)
        
        // when
        sut.loadView()
        sut.sections = [Section](repeating: dummySection, count: 5)
        
        // then
        for (index, section) in sut.sections.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.sectionsTable, cellForRowAt: indexPath)
            XCTAssertEqual(cell.textLabel?.text, section.title)
        }
    }
    
    func testProfileSectionTableCellHaveDisclosureIndicators() {
        // given
        let sut = ProfileController.instantiate(from: Constants.StoryboardNames.main)
        let dummySection = Section(title: "", summary: nil, workPlaces: nil, skills: nil)
        
        // when
        sut.loadView()
        sut.sections = [Section](repeating: dummySection, count: 5)

        // then
        for index in 0..<sut.sections.count {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.sectionsTable, cellForRowAt: indexPath)
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }
    
    func testProfileControllerHaveCorrectTitle() {
        // given
        let sut = ProfileController.instantiate(from: Constants.StoryboardNames.main)
        
        // when
        sut.loadViewIfNeeded()
        
        // then
        XCTAssertEqual(sut.title, "MyProfile")
    }
    
    // MARK: - Integration Tests
    func testSelectingCellShowsDetail() {
        // given
        let sut = ProfileController.instantiate(from: Constants.StoryboardNames.main)
        let testIndexPath = IndexPath(row: 0, section: 0)
        let dummySection = Section(title: "", summary: "", workPlaces: nil, skills: nil)
        let navigationController = UINavigationController(rootViewController: sut)
       
        // when
        sut.loadView()
        sut.sections = [Section](repeating: dummySection, count: 1)
        sut.showDetail = { _, _ in
            let detailController = DetailController.instantiate(from: Constants.StoryboardNames.main)
            navigationController.pushViewController(detailController, animated: true)
        }
        sut.tableView(sut.sectionsTable, didSelectRowAt: testIndexPath)
        
        // create an expectation…
        let expectation = XCTestExpectation(description: "Selecting a table view cell.")
        
        // …then fulfill it asynchronously
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        
        // then
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(navigationController.topViewController is DetailController)
    }
}



