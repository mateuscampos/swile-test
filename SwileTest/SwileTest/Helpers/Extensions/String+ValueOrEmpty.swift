//
//  String+ValueOrEmpty.swift
//  SwileTest
//
//  Created by Mateus de Campos on 14/03/23.
//

import Foundation

public extension Optional where Wrapped == String {
    var valueOrEmpty: String {
        guard let unwrapped = self else {
            return ""
        }
        return unwrapped
    }
}
