//
//  TransactionListViewModelTests.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 17/03/23.
//

import Foundation

import XCTest
@testable import SwileTest

class TransactionListViewModelTests: XCTestCase {

    var viewModel: TransactionListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = TransactionListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testGroupByMonth() {

        let transaction1 = Transaction(name: "Restos du coeur",
                                       type: .donation,
                                       date: "2021-03-07T14:04:45.000+01:00",
                                       message: nil,
                                       amount: TransactionAmount(value: -0.07,
                                                                 currency: TransactionCurrency(iso3: "EUR",
                                                                                               symbol: "€",
                                                                                               title: "Euro")),
                                       smallIcon: TransactionSmallIcon(category: .mealVoucher),
                                       largeIcon: TransactionLargeIcon(category: .donation))
        let transaction2 = Transaction(name: "Sushi WA",
                                       type: .mealVoucher,
                                       date: "2021-03-07T12:04:45.000+01:00",
                                       message: nil,
                                       amount: TransactionAmount(value: -18.63,
                                                                 currency: TransactionCurrency(iso3: "EUR",
                                                                                               symbol: "€",
                                                                                               title: "Euro")),
                                       smallIcon: TransactionSmallIcon(category: .mealVoucher),
                                       largeIcon: TransactionLargeIcon(category: .sushi))
        let transaction3 = Transaction(name: "FNAC",
                                       type: .gift,
                                       date: "2021-02-12T08:45:45.000+01:00",
                                       message: nil,
                                       amount: TransactionAmount(value: -49.9,
                                                                 currency: TransactionCurrency(iso3: "EUR",
                                                                                               symbol: "€",
                                                                                               title: "Euro")),
                                       smallIcon: TransactionSmallIcon(category: .mealVoucher),
                                       largeIcon: TransactionLargeIcon(category: .sushi))

        let transactions = [transaction1, transaction2, transaction3]

        let groupedTransactions = viewModel.groupByMonth(transactions)

        XCTAssertEqual(groupedTransactions.count, 2)
        XCTAssertEqual(groupedTransactions[0].monthName, "Mars")
        XCTAssertEqual(groupedTransactions[1].monthName, "Février")
        XCTAssertEqual(groupedTransactions[0].transactions.count, 2)
        XCTAssertEqual(groupedTransactions[1].transactions.count, 1)
        XCTAssertEqual(groupedTransactions[0].transactions[0].id, transaction1.id)
        XCTAssertEqual(groupedTransactions[0].transactions[1].id, transaction2.id)
        XCTAssertEqual(groupedTransactions[1].transactions[0].id, transaction3.id)
    }
    
}
