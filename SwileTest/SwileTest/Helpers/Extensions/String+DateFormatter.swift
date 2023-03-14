//
//  String+DateFormatter.swift
//  SwileTest
//
//  Created by Mateus de Campos on 14/03/23.
//

import Foundation

extension String {
    
    var fromServerTo_dMMM: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)

        dateFormatter.dateFormat = "d MMMM"
        dateFormatter.locale = Locale(identifier: "fr_FR")

        guard let unwpdDate = date else {
            return ""
        }

        return dateFormatter.string(from: unwpdDate)
    }
}
