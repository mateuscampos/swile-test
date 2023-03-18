//
//  TransactionSmallIconCategoryTests.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 17/03/23.
//

import Foundation

import XCTest
@testable import SwileTest

class TransactionSmallIconCategoryTests: XCTestCase {

    func testImageName() {
        XCTAssertEqual(TransactionSmallIconCategory.mealVoucher.imageName(), "small_icon_fork")
        XCTAssertEqual(TransactionSmallIconCategory.gift.imageName(), "small_icon_gift")
        XCTAssertEqual(TransactionSmallIconCategory.mobility.imageName(), "small_icon_bike")
        XCTAssertEqual(TransactionSmallIconCategory.payment.imageName(), "")
    }
    
}
