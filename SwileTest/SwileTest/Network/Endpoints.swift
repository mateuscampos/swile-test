//
//  Endpoints.swift
//  SwileTest
//
//  Created by guru on 11/03/23.
//

import Foundation

enum Endpoint: String {
    static let baseUrl = "https://gist.githubusercontent.com"
    case transactionList =
            "/Aurazion/365d587f5917d1478bf03bacabdc69f3/raw/3c92b70e1dc808c8be822698f1cbff6c95ba3ad3/transactions.json"

    func url() -> URL {
        guard let url = URL(string: Endpoint.baseUrl + self.rawValue) else {
            fatalError("Could not get base url")
        }
        return url
    }
}
