//
//  URLSessionDataTaskMock.swift
//  SwileTestTests
//
//  Created by guru on 10/03/23.
//

import Foundation
@testable import SwileTest

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
    var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}
