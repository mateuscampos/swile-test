//
//  TransactionTests.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 17/03/23.
//

import Foundation

import XCTest
@testable import SwileTest

class TransactionTests: XCTestCase {
    var transaction: Transaction!
    
    override func setUp() {
        super.setUp()
        transaction = Transaction(
            name: "Restos du coeur",
            type: .donation,
            date: "2021-03-07T14:04:45.000+01:00",
            message: "Don à l'arrondi",
            amount: TransactionAmount(value: -0.07,
                                      currency: TransactionCurrency(iso3: "EUR",
                                                                    symbol: "€",
                                                                    title: "Euro")),
            smallIcon: TransactionSmallIcon(category: .gift),
            largeIcon: TransactionLargeIcon(category: .bakery)
        )
    }
    
    func testDescription() {
        XCTAssertEqual(transaction.description, "7 mars・Don à l'arrondi")
        transaction.message = nil
        XCTAssertEqual(transaction.description, "7 mars")
    }
    
    func testFormattedDate() {
        XCTAssertEqual(transaction.formattedDate, "dimanche 7 mars, 10:04")
    }
    
    func testAmountWithCurrency() {
        XCTAssertEqual(transaction.amountWithCurrency, "-0,07 €")
        transaction.amount = TransactionAmount(value: -50, currency: TransactionCurrency(iso3: "EUR",
                                                                                         symbol: "€",
                                                                                         title: "Euro"))
        XCTAssertEqual(transaction.amountWithCurrency, "-50 €")
    }
    
    func testHasLargeIconUrl() {
        XCTAssertFalse(transaction.hasLargeIconUrl)
        transaction.largeIcon.url = URL(string: "https://example.com/large_icon.png")
        XCTAssertTrue(transaction.hasLargeIconUrl)
    }
    
    func testLargeIconSize() {
        XCTAssertEqual(transaction.largeIconSize, 28)
        transaction.largeIcon.url = URL(string: "https://example.com/large_icon.png")
        XCTAssertEqual(transaction.largeIconSize, 56)
    }
    
    func testHeaderIconSize() {
        XCTAssertEqual(transaction.headerIconSize, 56)
    }
    
    func testIsPositive() {
        transaction.amount = TransactionAmount(value: 10, currency: TransactionCurrency(iso3: "EUR",
                                                                                       symbol: "€",
                                                                                       title: "Euro"))
        XCTAssertTrue(transaction.isPositive)
        transaction.amount = TransactionAmount(value: 0, currency: TransactionCurrency(iso3: "EUR",
                                                                                       symbol: "€",
                                                                                       title: "Euro"))
        XCTAssertTrue(transaction.isPositive)
        transaction.amount = TransactionAmount(value: -10, currency: TransactionCurrency(iso3: "EUR",
                                                                                         symbol: "€",
                                                                                         title: "Euro"))
        XCTAssertFalse(transaction.isPositive)
    }
}
