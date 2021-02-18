//
//  CommitTest.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest

class CommitTest: XCTestCase {

    var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
    }
    
    func testInitJSON_validJSON() {
        let jsonData = Resources.data(forJson: "commit-valid")
        let expected = Resources.validCommit()
        XCTAssertEqual(try decoder.decode(CommitInfo.self, from: jsonData), expected)
    }

    func testInitJSON_missingKey() {
        let jsonData = Resources.data(forJson: "commit-missing-key")
        XCTAssertThrowsError(try decoder.decode(CommitInfo.self, from: jsonData))
    }
}
