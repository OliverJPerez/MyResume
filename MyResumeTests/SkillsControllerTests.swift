//
//  SkillsControllerTests.swift
//  MyResumeTests
//
//  Created by OliverPérez on 6/1/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import XCTest
@testable import MyResume

// MARK: SkillsControllerTests
class SkillsControllerTests: XCTestCase {
    // MARK: - Unit Tests
    func testSkillsTableExists() {
        // given
        let sut = SkillsController.instantiate(from: Constants.StoryboardNames.main)
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.skillsTable)
    }
    
    func testSkillsTableHaveCorrectRowCount() {
        // given
        let sut = SkillsController.instantiate(from: Constants.StoryboardNames.main)
        let dummySkill = Skill(name: "Swift", score: 5)
        
        // when
        sut.loadView()
        sut.skills = [Skill](repeating: dummySkill, count: 5)
        
        // then
        let rowCount = sut.tableView(sut.skillsTable, numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, sut.skills.count)
    }
    
    func testSkillsTableCustomCellIsNotNil() {
        // given
        let sut = SkillsController.instantiate(from: Constants.StoryboardNames.main)
        let dummySkill = Skill(name: "Swift", score: 5)

        // when
        sut.loadView()
        sut.skills = [dummySkill]

        // then
        let indexPath = IndexPath(item: 0, section: 0)
        let cell = sut.tableView(sut.skillsTable, cellForRowAt: indexPath) as? SkillCellController
        XCTAssertNotNil(cell)
    }
    
    func testSkillsTableCellHaveCorrectName() {
        // given
        let sut = SkillsController.instantiate(from: Constants.StoryboardNames.main)
        let dummySkill = Skill(name: "Swift", score: 5)
        
        // when
        sut.loadView()
        sut.skills = [Skill](repeating: dummySkill, count: 3)
        
        // then
        for (index, skill) in sut.skills.enumerated() {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.skillsTable, cellForRowAt: indexPath) as? SkillCellController
            XCTAssertEqual(cell?.skillName.text, skill.name)
        }
    }

    func testProfileSectionTableCellHaveCorrectAmountOfStars() {
        // given
        let sut = SkillsController.instantiate(from: Constants.StoryboardNames.main)
        let dummySkill1 = Skill(name: "Swift", score: 1)
        let dummySkill2 = Skill(name: "Xcode", score: 2)
        let dummySkill3 = Skill(name: "Testing", score: 3)
        let dummySkill4 = Skill(name: "Debugging", score: 4)
        let dummySkill5 = Skill(name: "Git", score: 5)

        // when
        sut.loadView()
        sut.skills = [dummySkill1, dummySkill2, dummySkill3, dummySkill4, dummySkill5]
        
        // then
        for index in 0..<sut.skills.count {
            let indexPath = IndexPath(item: index, section: 0)
            let cell = sut.tableView(sut.skillsTable, cellForRowAt: indexPath) as? SkillCellController
            var starsImages = 0
            for star in cell?.stars ?? [] {
                if star.image != nil {
                    starsImages += 1
                }
            }
            XCTAssertEqual(starsImages, cell?.score)
        }
    }
}
