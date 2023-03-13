//
//  TransactionListResponseModel.swift
//  SwileTest
//
//  Created by Mateus de Campos on 10/03/23.
//

import Foundation

struct TransactionListResponseModel: Codable {
    let transactions: [Transaction]
}
