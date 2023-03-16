//
//  TransactionLargeIconCategory.swift
//  SwileTest
//
//  Created by Mateus de Campos on 14/03/23.
//

import UIKit

enum TransactionLargeIconCategory: String, Codable {
    case donation
    case sushi
    case computer
    case train
    case burger
    case bakery
    case supermarket
    case payment

    func imageName() -> String {
        switch self {
        case .sushi:
            return "icon_sushi"
        case .computer:
            return "icon_tech"
        case .train:
            return "icon_subway"
        case .burger:
            return "icon_burger"
        case .bakery:
            return "icon_croissant"
        case .supermarket:
            return "icon_meal"
        default:
            return ""
        }
    }

    func illustrationColor() -> UIColor {
        switch self {
        case .sushi, .burger, .bakery, .supermarket:
            return .illustrationOrange
        case .computer:
            return .illustrationPink
        case .train:
            return .illustrationRed
        default:
            return .background
        }
    }
}
