//
//  String+ValueOrEmptyTests.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 17/03/23.
//

import Foundation

import XCTest
@testable import SwileTest

class StringValueOrEmptyTests: XCTestCase {
    
    func testValueOrEmpty_whenNil_returnsEmptyString() {
        let optionalString: String? = nil
        let result = optionalString.valueOrEmpty
        XCTAssertEqual(result, "")
    }
    
    func testValueOrEmpty_whenNotNil_returnsUnwrappedString() {
        let optionalString: String? = "Hello, world!"
        let result = optionalString.valueOrEmpty
        XCTAssertEqual(result, "Hello, world!")
    }
    
}
