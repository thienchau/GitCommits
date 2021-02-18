//
//  CommitServiceTest.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest
import Alamofire
@testable import GitCommits

class commitServiceTests: XCTestCase {
    var subject: GitService!
    var httpClient: FakeHTTPClient!
    let httpRequest = HTTPRequest(url: URL(string: "https://api.github.com/repos/alamofire/alamofire/commits?per_page=25")!)

    override func setUp() {
        super.setUp()
        httpClient = FakeHTTPClient()
        subject = GitService(httpClient: httpClient)
    }

    func testCommit_httpFailure() {
        var commitResult: Result<[CommitInfo], Error>?
        let expect = expectation(description: "commit completed")
        
        httpClient.send_stubbed[httpRequest] = .failure(HTTPError.emptyResponse)
        subject.getRecentCommits() { result in
            commitResult = result
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssertTrue(commitResult!.isFailure)
    }
    
    func testCommit_httpSuccessDeserializerFailure() {
        var commitResult: Result<[CommitInfo], Error>?
        let expect = expectation(description: "commit completed")

        httpClient.send_stubbed[httpRequest] = .success(Resources.data(forJson: "commit-invalid-response"))
        subject.getRecentCommits() { result in
            commitResult = result
            expect.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)

        XCTAssertTrue(commitResult!.isFailure)
    }

    func testcommit_httpSuccessDeserializerSuccess() throws {
        var commitResult: Result<[CommitInfo], Error>?
        let expect = expectation(description: "commit completed")

        httpClient.send_stubbed[httpRequest] = .success(Resources.data(forJson: "commit-valid-response"))
        subject.getRecentCommits() { result in
            commitResult = result
            expect.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)

        XCTAssertEqual(try commitResult?.get(), Resources.commits())
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
