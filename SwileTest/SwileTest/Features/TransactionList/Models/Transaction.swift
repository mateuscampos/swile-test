//
//  Transaction.swift
//  SwileTest
//
//  Created by guru on 11/03/23.
//

import Foundation

struct Transaction: Codable {
    let name: String
    let type: TransactionType
    let date: String
    let message: String?
    let amount: TransactionAmount
    let smallIcon: TransactionIcon?
    let largeIcon: TransactionIcon?

    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case date
        case message
        case amount
        case smallIcon = "small_icon"
        case largeIcon = "large_icon"
    }
}
