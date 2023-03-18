//
//  Double+NumberFormatterTests.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 17/03/23.
//

import Foundation

import XCTest
@testable import SwileTest

class DoubleNumberFormatterTests: XCTestCase {
    func testLocalizedValue_roundedValue() {
        let value = 100.0
        
        let localizedString = value.localizedValue
        
        XCTAssertEqual(localizedString, "100")
    }
    
    func testLocalizedValue_decimalValue() {
        let value = -0.07
        
        let localizedString = value.localizedValue
        
        XCTAssertEqual(localizedString, "-0,07")
    }
}
