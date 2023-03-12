//
//  NetworkService.swift
//  SwileTest
//
//  Created by guru on 10/03/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return dataTask(with: request,
                        completionHandler: completionHandler) as URLSessionDataTaskProtocol
    }
}

typealias NetworkServiceCompletion = (Result<Data, Error>) -> Void

protocol NetworkServiceProtocol {
    func request(url: URL,
                 method: HTTPMethod,
                 parameters: [String: Any]?,
                 headers: [String: String]?,
                 completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request(url: URL,
                 method: HTTPMethod,
                 parameters: [String: Any]? = nil,
                 headers: [String: String]? = nil,
                 completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        if let parameters = parameters {
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        }
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "",
                                            code: -1,
                                            userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
