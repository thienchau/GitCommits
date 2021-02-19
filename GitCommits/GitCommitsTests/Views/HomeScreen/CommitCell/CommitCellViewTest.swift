//
//  CommitCellViewTest.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest
@testable import GitCommits

class CommitCellViewTest: CustomViewTests {

    func testInitByCoder() {
        expectFatalError(expectedMessage: "init(coder:) has not been implemented") {
            _ = CommitCellView(coder: NSCoder())
        }
    }
    
    override func customView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200))
        let cell1 = CommitCellView()
        cell1.frame = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width, height: 100)
        cell1.configure(commitInfo: Resources.validCommit())
        
        XCTAssertEqual(cell1.shaLabel.text, Resources.validCommit().sha)
        XCTAssertEqual(cell1.authorLabel.text, Resources.validCommit().commit.author.name)
        XCTAssertEqual(cell1.commentLabel.text, Resources.validCommit().commit.message)
        
        let cell2 = CommitCellView()
        cell2.frame = CGRect(x: 0, y: 120, width: UIScreen.main.bounds.width, height: 100)
        cell2.configure(commitInfo: Resources.validCommit())
        cell2.clearUI()
        
        XCTAssertEqual(cell2.shaLabel.text, nil)
        XCTAssertEqual(cell2.authorLabel.text, nil)
        XCTAssertEqual(cell2.commentLabel.text, nil)
        
        view.addSubview(cell1)
        view.addSubview(cell2)
        return view
    }
}
