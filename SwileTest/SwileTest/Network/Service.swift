//
//  TransactionListService.swift
//  SwileTest
//
//  Created by Mateus de Campos on 10/03/23.
//

import Foundation

class Service<T: Decodable>: ServiceProtocol {

    var networkService: NetworkServiceProtocol
    var url: URL
    var method: HTTPMethod
    var parameters: [String : Any]?
    var headers: [String : String]?
    var completion: ((Result<T, Error>) -> Void)?

    init(networkService: NetworkServiceProtocol = NetworkService(),
         url: URL,
         method: HTTPMethod,
         parameters: [String : Any]? = nil,
         headers: [String : String]? = nil,
         completion: ((Result<T, Error>) -> Void)? = nil) {
        self.networkService = networkService
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.completion = completion
    }

    func start() {
        networkService.request(url: url,
                               method: method,
                               parameters: parameters,
                               headers: headers) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    self.completion?(.success(decodedData))
                } catch let error {
                    self.completion?(.failure(error))
                }
            case .failure(let error):
                self.completion?(.failure(error))
            }
        }
    }
}
