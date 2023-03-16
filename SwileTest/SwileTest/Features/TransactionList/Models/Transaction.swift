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
    let smallIcon: TransactionSmallIcon
    let largeIcon: TransactionLargeIcon

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

    var amountWithCurrency: String {
        return "\(isPositive ? "+" : "")\(amount.value.localizedValue) \(amount.currency.symbol)"
    }

    var hasLargeIconUrl: Bool {
        return ((largeIcon.url) != nil) ? true : false
    }

    var largeIconSize: Double {
        return hasLargeIconUrl ? 56 : 28
    }

    var isPositive: Bool {
        return self.amount.value > 0
    }
}

extension Transaction {
    static func preview() -> Transaction {
        return Transaction(name: "Restos du coeur",
                           type: .donation,
                           date: "2021-03-07T14:04:45.000+01:00",
                           message: "Don à l'arrondi",
                           amount: TransactionAmount(value: -0.07,
                                                     currency: TransactionCurrency(iso3: "EUR",
                                                                                   symbol: "€",
                                                                                   title: "Euro")),
                           smallIcon: TransactionSmallIcon(url: nil,
                                                           category: .mealVoucher),
                           largeIcon: TransactionLargeIcon(url: URL(string: "https://res.cloudinary.com/hbnjrwllw/image/upload/v1583240999/neobank/charity/cdaa7851-da33-4b3c-8e01-228c4b085ac3.png"),
                                                           category: .donation))
    }
}
