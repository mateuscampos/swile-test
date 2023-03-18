//
//  String+DateFormatterTests.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 17/03/23.
//

import Foundation

import XCTest
@testable import SwileTest

class StringDateFormatterTests: XCTestCase {
    func testFromServerTo_dMMM() {
        let dateString = "2023-03-17T15:30:00.000Z"

        let formattedString = dateString.fromServerTo_dMMM

        XCTAssertEqual(formattedString, "17 mars")
    }

    func testFromServerToFormattedString() {
        let dateString = "2023-03-17T15:30:00.000Z"

        let formattedString = dateString.fromServerToFormattedString

        XCTAssertEqual(formattedString, "vendredi 17 mars, 12:30")
    }

    func testFromServerToDate() {
        let dateString = "2023-03-17T15:30:00.000Z"

        let date = dateString.fromServerToDate

        XCTAssertNotNil(date)
    }
}
