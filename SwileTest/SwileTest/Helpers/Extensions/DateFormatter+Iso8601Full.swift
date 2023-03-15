//
//  DateFormatter+Iso8601Full.swift
//  SwileTest
//
//  Created by Mateus de Campos on 14/03/23.
//

import Foundation

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter
    }()
}
