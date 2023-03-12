//
//  TransactionCurrency.swift
//  SwileTest
//
//  Created by guru on 11/03/23.
//

import Foundation

struct TransactionCurrency: Codable {
    let iso3: String
    let symbol: String
    let title: String
    
    private enum CodingKeys: String, CodingKey {
        case iso3 = "iso_3"
        case symbol
        case title
    }
}
