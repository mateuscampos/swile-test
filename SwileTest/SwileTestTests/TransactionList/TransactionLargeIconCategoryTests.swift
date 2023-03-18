//
//  TransactionLargeIconCategoryTests.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 17/03/23.
//

import Foundation

import XCTest
@testable import SwileTest

class TransactionLargeIconCategoryTests: XCTestCase {

    func testImageName() {
        XCTAssertEqual(TransactionLargeIconCategory.sushi.imageName(), "icon_sushi")
        XCTAssertEqual(TransactionLargeIconCategory.computer.imageName(), "icon_tech")
        XCTAssertEqual(TransactionLargeIconCategory.train.imageName(), "icon_subway")
        XCTAssertEqual(TransactionLargeIconCategory.burger.imageName(), "icon_burger")
        XCTAssertEqual(TransactionLargeIconCategory.bakery.imageName(), "icon_croissant")
        XCTAssertEqual(TransactionLargeIconCategory.supermarket.imageName(), "icon_meal")
        XCTAssertEqual(TransactionLargeIconCategory.payment.imageName(), "")
    }

    func testIllustrationColor() {
        XCTAssertEqual(TransactionLargeIconCategory.sushi.illustrationColor(), .illustrationOrange)
        XCTAssertEqual(TransactionLargeIconCategory.computer.illustrationColor(), .illustrationPink)
        XCTAssertEqual(TransactionLargeIconCategory.train.illustrationColor(), .illustrationRed)
        XCTAssertEqual(TransactionLargeIconCategory.burger.illustrationColor(), .illustrationOrange)
        XCTAssertEqual(TransactionLargeIconCategory.bakery.illustrationColor(), .illustrationOrange)
        XCTAssertEqual(TransactionLargeIconCategory.supermarket.illustrationColor(), .illustrationOrange)
        XCTAssertEqual(TransactionLargeIconCategory.payment.illustrationColor().resolvedColor(with: UITraitCollection.current),
                       .background.resolvedColor(with: UITraitCollection.current))
    }

}
