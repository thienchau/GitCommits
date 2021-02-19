//
//  CommitCellTest.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest
@testable import GitCommits

class CommitCellTest: XCTestCase {

    var subject: CommitCell!
    var cellView: FakeCommitCellView!
    
    override func setUpWithError() throws {
        cellView = FakeCommitCellView()
        subject = CommitCell(style: .default, reuseIdentifier: "CommitCell")
    }
    
    func testInitByCoder() {
        expectFatalError(expectedMessage: "init(coder:) has not been implemented") {
            _ = CommitCell(coder: NSCoder())
        }
    }
    
    func testReuseID() {
        XCTAssertEqual(CommitCell.identifier, "CommitCell")
    }
    
    func testConfigure() {
        subject.commitCellView = cellView
        subject.configure(commitInfo: Resources.validCommit())
        XCTAssertEqual(cellView.configure_wasCalledWithParam, Resources.validCommit())
    }
    
    func testClearUI() {
        subject.commitCellView = cellView
        subject.prepareForReuse()
        XCTAssertTrue(cellView.clearUI_wasCalled)
    }

    override func tearDownWithError() throws {
    }
}
