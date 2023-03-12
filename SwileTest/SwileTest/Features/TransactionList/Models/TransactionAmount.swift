//
//  TransactionAmount.swift
//  SwileTest
//
//  Created by guru on 11/03/23.
//

import Foundation

struct TransactionAmount: Codable {
    let value: Double
    let currency: TransactionCurrency
}
