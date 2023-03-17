//
//  Transaction.swift
//  SwileTest
//
//  Created by Mateus de Campos on 11/03/23.
//

import Foundation

struct Transaction: Codable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let type: TransactionType
    let date: String
    let message: String?
    let amount: TransactionAmount
    var smallIcon: TransactionSmallIcon
    var largeIcon: TransactionLargeIcon

    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case date
        case message
        case amount
        case smallIcon = "small_icon"
        case largeIcon = "large_icon"
    }

    var description: String {
        guard let message = self.message else {
            return self.date.fromServerTo_dMMM
        }
        return self.date.fromServerTo_dMMM + "・" + message
    }

    var formattedDate: String {
        return self.date.fromServerToFormattedString
    }

    var amountWithCurrency: String {
        return "\(isPositive ? "+" : "")\(amount.value.localizedValue) \(amount.currency.symbol)"
    }

    var hasLargeIconUrl: Bool {
        return ((largeIcon.url) != nil) ? true : false
    }

    var largeIconSize: Double {
        return hasLargeIconUrl ? 56 : 28
    }

    var headerIconSize: Double {
        return 56
    }

    var isPositive: Bool {
        return self.amount.value > 0
    }
}

extension Transaction {
    static func preview() -> Transaction {
        return Transaction(name: "Sushi WA",
                           type: .mealVoucher,
                           date: "2021-03-07T12:04:45.000+01:00",
                           message: nil,
                           amount: TransactionAmount(value: -18.63,
                                                     currency: TransactionCurrency(iso3: "EUR",
                                                                                   symbol: "€",
                                                                                   title: "Euro")),
                           smallIcon: TransactionSmallIcon(url: nil,
                                                           category: .mealVoucher),
                           largeIcon: TransactionLargeIcon(url: nil,
                                                           category: .sushi))
    }
}
