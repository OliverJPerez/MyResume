//
//  Result.swift
//  MyResume
//
//  Created by Oliver Jordy Perez Escamilla on 5/31/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import Foundation

// MARK: Result
/// A value that represents success or failure including an associated value
public enum Result<Success, Failure> where Failure: Error {
    case success(Success)
    case failure(Failure)
}
