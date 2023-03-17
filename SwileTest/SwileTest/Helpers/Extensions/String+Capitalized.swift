//
//  String+Capitalized.swift
//  SwileTest
//
//  Created by Mateus de Campos on 16/03/23.
//

import Foundation

extension String {
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
