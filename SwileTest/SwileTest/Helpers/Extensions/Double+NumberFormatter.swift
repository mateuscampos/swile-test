//
//  Double+NumberFormatter.swift
//  SwileTest
//
//  Created by Mateus de Campos on 14/03/23.
//

import Foundation

extension Double {
    var localizedValue: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.numberStyle = .decimal
        if self == self.rounded() {
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 0
        } else {
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            formatter.decimalSeparator = ","
        }
        if let localizedString = formatter.string(for: self) {
            return localizedString
        }
        return "\(self)"
    }
}
