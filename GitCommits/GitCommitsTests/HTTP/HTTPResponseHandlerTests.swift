//
//  HTTPResponseHandlerTests.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest
import Alamofire
@testable import GitCommits


class HTTPResponseHandlerTests: XCTestCase {
    var subject: HTTPResponseHandler!
    
    override func setUp() {
        super.setUp()
        subject = HTTPResponseHandler()
    }

    func testHandle_errorIsNonNil() throws {
        let dataResponse = AFDataResponse<Data>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: .failure(.responseValidationFailed(reason: .unacceptableStatusCode(code: 500))))
        let result = subject.handle(dataResponse: dataResponse)
        XCTAssertTrue(result.isFailure)
    }
    
    func testHandle_statusCodeIsGreaterEqualTo400() throws {
        let response = HTTPURLResponse(url: URL(string: "http://www.example.com")!, statusCode: 404, httpVersion: "1.1", headerFields: [:])
        let dataResponse = AFDataResponse<Data>(request: nil, response: response, data: nil, metrics: nil, serializationDuration: 0, result: .success(Data()))
        let result = subject.handle(dataResponse: dataResponse)
        XCTAssertEqual(result.getFailure(), HTTPError.statusCode(404))
    }
    
    func testHandle_dataIsNonNil() throws {
        let data = "{\"some_key\": \"value\"}".data(using: .utf8)

        let response = HTTPURLResponse(url: URL(string: "http://www.example.com")!, statusCode: 200, httpVersion: "1.1", headerFields: [:])
        let dataResponse = AFDataResponse<Data>(request: nil, response: response, data: data, metrics: nil, serializationDuration: 0, result: .success(data!))
        let result = subject.handle(dataResponse: dataResponse)
        XCTAssertEqual(try result.get(), data)
    }
        
    func testHandle_errorIsNil_statusCodeIsLess400_dataIsNil() {
        let response = HTTPURLResponse(url: URL(string: "http://www.example.com")!, statusCode: 200, httpVersion: "1.1", headerFields: [:])
        let dataResponse = AFDataResponse<Data>(request: nil, response: response, data: nil, metrics: nil, serializationDuration: 0, result: .success(Data()))
        let result = subject.handle(dataResponse: dataResponse)
        XCTAssertTrue(result.isFailure)
    }
}

