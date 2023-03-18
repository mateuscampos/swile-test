//
//  String+CapitalizedTests.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 17/03/23.
//

import Foundation

import XCTest
@testable import SwileTest

class StringCapitalizedTests: XCTestCase {

    func testCapitalizedSentence() {
        let testString = "this is a test string"
        let expectedString = "This is a test string"

        let resultString = testString.capitalizedSentence

        XCTAssertEqual(resultString, expectedString)
    }
    
}
