//
//  TransactionMonthGroup.swift
//  SwileTest
//
//  Created by Mateus de Campos on 14/03/23.
//

import Foundation

struct TransactionMonthGroup: Identifiable {
    let id: UUID = UUID()
    let monthName: String
    let transactions: [Transaction]
}
