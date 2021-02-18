//
//  HTTPClientTests.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
import Alamofire
import XCTest
@testable import GitCommits

class HTTPClientTests: XCTestCase {
    var subject: HTTPClient!
    var sessionManager: FakeSessionManager!
    var responseHandler: FakeHTTPResponseHandler!

    override func setUp() {
        super.setUp()
        sessionManager = FakeSessionManager()
        responseHandler = FakeHTTPResponseHandler()
        subject = HTTPClient(manager: sessionManager, responseHandler: responseHandler)
    }

    func testSend() throws {
        sessionManager.request_stubbed = AFDataResponse<Data>(request: nil, response: nil, data: Data([0x11, 0x22, 0x33, 0x44]), metrics: nil, serializationDuration: 0, result: .success(Data()))
        responseHandler.handle_stubbed = Result.success(Resources.data(forJson: "http-client-test-body"))
        
        var completion_wasCalled = false
        var completion_wasCalled_withResult: Result<Data, Error>? = nil
        
        subject.send(request: HTTPRequest(url: URL(string: "http://www.example.com")!), completion: { result in
            completion_wasCalled = true
            completion_wasCalled_withResult = result
        })
    
        XCTAssertTrue(sessionManager.request_wasCalled)

        XCTAssertTrue(responseHandler.handle_wasCalled)
        XCTAssertEqual(responseHandler.handle_wasCalled_withDataResponse?.data, Data([0x11, 0x22, 0x33, 0x44]))
        XCTAssertNil(responseHandler.handle_wasCalled_withDataResponse?.request)
        XCTAssertNil(responseHandler.handle_wasCalled_withDataResponse?.response)
        XCTAssertNil(responseHandler.handle_wasCalled_withDataResponse?.error)

        XCTAssertTrue(completion_wasCalled)
        XCTAssertEqual(try completion_wasCalled_withResult!.get(), Resources.data(forJson: "http-client-test-body"))
        
    }
}

