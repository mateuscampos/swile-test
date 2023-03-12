//
//  NetworkServiceTests.swift
//  SwileTestTests
//
//  Created by guru on 10/03/23.
//

import XCTest
import Foundation
@testable import SwileTest

class NetworkServiceTests: XCTestCase {
    var sut: NetworkService!
    var sessionMock: URLSessionMock!
    
    override func setUpWithError() throws {
        sessionMock = URLSessionMock()
        sut = NetworkService(session: sessionMock)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        sessionMock = nil
    }
    
    func testGetRequest() {
        let url = URL(string: "https://mock.com")!
        let expectation = XCTestExpectation(description: "Completion")
        sessionMock.nextData = Data()
        sessionMock.nextError = nil
        sut.request(url: url, method: .get) { result in
            XCTAssertEqual(self.sessionMock.lastRequest?.url, url)
            XCTAssertEqual(self.sessionMock.lastRequest?.httpMethod, "GET")
            XCTAssertNotNil(self.sessionMock.nextDataTask)
            switch result {
            case .success(let data):
                XCTAssertEqual(data, Data())
            case .failure(_):
                XCTFail("Should not fail")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(self.sessionMock.nextDataTask.resumeWasCalled)
    }
    
    func testPostRequest() {
        let url = URL(string: "https://mock.com")!
        let expectation = XCTestExpectation(description: "Completion")
        let parameters = ["foo": "bar"]
        sessionMock.nextData = Data()
        sessionMock.nextError = nil
        sut.request(url: url, method: .post, parameters: parameters) { result in
            XCTAssertEqual(self.sessionMock.lastRequest?.url, url)
            XCTAssertEqual(self.sessionMock.lastRequest?.httpMethod, "POST")
            XCTAssertNotNil(self.sessionMock.nextDataTask)
            switch result {
            case .success(let data):
                XCTAssertEqual(data, Data())
            case .failure(_):
                XCTFail("Should not fail")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(self.sessionMock.lastRequest?.httpBody, try? JSONSerialization.data(withJSONObject: parameters))
        XCTAssertTrue(self.sessionMock.nextDataTask.resumeWasCalled)
    }
    
    func testError() {
        let url = URL(string: "https://mock.com")!
        let expectation = XCTestExpectation(description: "Completion")
        sessionMock.nextData = nil
        sessionMock.nextError = NSError(domain: "", code: -1, userInfo: nil)
        sut.request(url: url, method: .get) { result in
            XCTAssertEqual(self.sessionMock.lastRequest?.url, url)
            XCTAssertEqual(self.sessionMock.lastRequest?.httpMethod, "GET")
            XCTAssertNotNil(self.sessionMock.nextDataTask)
            switch result {
            case .success(_):
                XCTFail("Should not succeed")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(self.sessionMock.nextDataTask.resumeWasCalled)
    }
}
