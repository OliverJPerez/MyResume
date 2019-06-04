//
//  ExperienceControllerTests.swift
//  MyResumeTests
//
//  Created by OliverPérez on 6/1/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import XCTest
@testable import MyResume

// MARK: ExperienceControllerTests
class ExperienceControllerTests: XCTestCase {
    // MARK: - Unit Tests
    func testWorkPlacesTableExists() {
        // given
        let sut = ExperienceController.instantiate(from: Constants.StoryboardNames.main)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.workPlaces)
    }

    func testWorkPlacesTableHaveCorrectRowCount() {
        // given
        let sut = ExperienceController.instantiate(from: Constants.StoryboardNames.main)
        let dummySection = WorkPlace(name: "", description: "")

        // when
        sut.loadView()
        sut.workPlaces = [WorkPlace](repeating: dummySection, count: 5)

        // then
        let rowCount = sut.tableView(sut.workPlacesTable, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, sut.workPlaces.count)
    }

    func testWorkPlacesTableCellHaveCorrectTitle() {
        // given
        let sut = ExperienceController.instantiate(from: Constants.StoryboardNames.main)
        let dummySection = WorkPlace(name: "Title", description: "")

        // when
        sut.loadView()
        sut.workPlaces = [WorkPlace](repeating: dummySection, count: 5)
        
        // then
        for (index, workPlace) in sut.workPlaces.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.workPlacesTable, cellForRowAt: indexPath)
            XCTAssertEqual(cell.textLabel?.text, workPlace.name)
        }
    }

    func testWorkPlacesTableCellHaveDisclosureIndicators() {
        // given
        let sut = ExperienceController.instantiate(from: Constants.StoryboardNames.main)
        let dummySection = WorkPlace(name: "", description: "")

        // when
        sut.loadView()
        sut.workPlaces = [WorkPlace](repeating: dummySection, count: 5)

        // then
        for index in 0..<sut.workPlaces.count {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.workPlacesTable, cellForRowAt: indexPath)
            XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
        }
    }

    // MARK: - Integration Tests
    func testSelectingCellShowsDetail() {
        // given
        let sut = ExperienceController.instantiate(from: Constants.StoryboardNames.main)
        let testIndexPath = IndexPath(row: 0, section: 0)
        let dummySection = WorkPlace(name: "", description: "")
        let navigationController = UINavigationController(rootViewController: sut)

        // when
        sut.loadView()
        sut.workPlaces = [WorkPlace](repeating: dummySection, count: 1)
        sut.showDetail = { _, _ in
            let detailController = DetailController.instantiate(from: Constants.StoryboardNames.main)
            navigationController.pushViewController(detailController, animated: true)
        }
        sut.tableView(sut.workPlacesTable, didSelectRowAt: testIndexPath)

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
