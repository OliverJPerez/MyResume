//
//  Profile.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import Foundation

// MARK: - Profile Model
public struct Profile: Codable {
    let name, summary: String
    let profilePicURL: String
    let sections: [Section]
}

// MARK: - Section Model
public struct Section: Codable {
    let title: String
    let summary: String?
    let workPlaces: [WorkPlace]?
    let skills: [Skill]?
}

// MARK: - Skill Model
public struct Skill: Codable {
    let name: String
    let score: Int
}

// MARK: - WorkPlace Model
public struct WorkPlace: Codable {
    let name, description: String
}
