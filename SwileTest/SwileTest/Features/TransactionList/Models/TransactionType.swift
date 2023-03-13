//
//  TransactionType.swift
//  SwileTest
//
//  Created by Mateus de Campos on 11/03/23.
//

import Foundation

enum TransactionType: String, Codable {
    case donation
    case mealVoucher = "meal_voucher"
    case gift
    case mobility
    case payment
}
