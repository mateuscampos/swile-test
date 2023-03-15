//
//  TransactionSmallIconCategory.swift
//  SwileTest
//
//  Created by Mateus de Campos on 14/03/23.
//

import Foundation

enum TransactionSmallIconCategory: String, Codable {
    case mealVoucher = "meal_voucher"
    case gift
    case mobility
    case payment

    func imageName() -> String {
        switch self {
        case .mealVoucher:
            return "small_icon_fork"
        case .gift:
            return "small_icon_gift"
        case .mobility:
            return "small_icon_bike"
        default:
            return ""
        }
    }
}
