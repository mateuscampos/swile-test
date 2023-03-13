//
//  URLSessionMock.swift
//  SwileTestTests
//
//  Created by Mateus de Campos on 10/03/23.
//

import Foundation
@testable import SwileTest

class URLSessionMock: URLSessionProtocol {
    var nextDataTask = URLSessionDataTaskMock()
    var lastRequest: URLRequest?
    var nextData: Data?
    var nextError: Error?
    
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        lastRequest = request
        completionHandler(nextData, nil, nextError)
        return nextDataTask
    }
}
