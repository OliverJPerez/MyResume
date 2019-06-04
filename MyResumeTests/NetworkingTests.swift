//
//  NetworkingTests.swift
//  MyResumeTests
//
//  Created by OliverPérez on 6/1/19.
//  Copyright © 2019 Oliver Jordy Perez Escamilla. All rights reserved.
//

import XCTest
@testable import MyResume

// MARK: NetworkingTests
class NetworkingTests: XCTestCase {
    // MARK: - Unit Tests
    func testProfileServiceSuccessResponse() {
        // given
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify profile success response", comment: ""))
        // when
        Service.shared.getProfile{ fetchResult in
            switch fetchResult {
        // then
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testProfileServiceInvalidURL() {
        // given
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify service layer invalid URL response", comment: ""))
        // when
        Service.shared.getProfile(with: Service.URLKeys.testInvalidURL) { fetchResult in
            switch fetchResult {
            // then
            case .success:
                XCTFail()
            case .failure(let error):
                switch error {
                case .invalidURL:
                    expectation.fulfill()
                default:
                    XCTFail()
                }
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testProfileServiceInvalidRequest() {
        // given
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify service layer invalid request response", comment: ""))
        // when
        Service.shared.getProfile(with: Service.URLKeys.testInvalidRequest) { fetchResult in
            switch fetchResult {
            // then
            case .success:
                XCTFail()
            case .failure(let error):
                switch error {
                case .invalidRequest:
                    expectation.fulfill()
                default:
                    XCTFail()
                }
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testProfileServiceInvalidData() {
        // given
        let expectation = XCTestExpectation(description: NSLocalizedString("Verify service layer fails decoding invalid data", comment: ""))
        // when
        Service.shared.getProfile(with: Service.URLKeys.testInvalidData) { fetchResult in
            switch fetchResult {
            // then
            case .success:
                XCTFail()
            case .failure(let error):
                switch error {
                case .invalidData:
                    expectation.fulfill()
                default:
                    XCTFail()
                }
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
}
