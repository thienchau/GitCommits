//
//  HTTPRequestTests.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest
@testable import GitCommits

class HTTPRequestTests: XCTestCase {

    func test_init() {
        let subject = HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get)
        XCTAssertEqual(subject.url, URL(string: "http://www.example.com")!)
        XCTAssertEqual(subject.method, HTTPRequest.Method.get)
    }
    
    func test_asURLRequest_methodIsGet() throws {
        let subject = HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get)
        let result = try subject.asURLRequest()

        XCTAssertEqual(result.url, URL(string: "http://www.example.com")!)
        XCTAssertEqual(result.httpMethod, "GET")
    }
    
    func test_equals_urlsAreDifferent() {
        let lhs = HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get)
        let rhs = HTTPRequest(url: URL(string: "http://www.stuff.com")!, method: .get)
        XCTAssertFalse(lhs == rhs)
    }
    
    func test_equals_urlsAndMethodsAreTheSame() {
        let lhs = HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get)
        let rhs = HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get)
        XCTAssertTrue(lhs == rhs)
    }
    
    func test_hashValue_httpRequestsAreEqual() {
        let lhs = HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get)
        let rhs = HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get)
        XCTAssertEqual(lhs.hashValue, rhs.hashValue)
    }
    
    func test_hashValue_httpRequestsAreDifferent() {
        let requests = Set([HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get),
                            HTTPRequest(url: URL(string: "http://www.stuff.com")!, method: .get),
                            HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get),
                            HTTPRequest(url: URL(string: "http://www.stuff.com")!, method: .get)])
        let expectedRequests = Set([HTTPRequest(url: URL(string: "http://www.example.com")!, method: .get),
                                  HTTPRequest(url: URL(string: "http://www.stuff.com")!, method: .get)])
        XCTAssertEqual(requests, expectedRequests)
    }
}

