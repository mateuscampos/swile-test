//
//  ServiceProtocol.swift
//  SwileTest
//
//  Created by Mateus de Campos on 10/03/23.
//

import Foundation

protocol ServiceProtocol {
    associatedtype T: Decodable
    var networkService: NetworkServiceProtocol { get set }
    var url: URL { get set }
    var method: HTTPMethod { get set }
    var parameters: [String: Any]? { get set }
    var headers: [String: String]? { get set }
    var completion: ((Result<T, Error>) -> Void)? { get set }
    func start()
}
