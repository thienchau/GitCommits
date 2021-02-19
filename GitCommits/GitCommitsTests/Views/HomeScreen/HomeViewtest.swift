//
//  HomeViewtest.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest
@testable import GitCommits

class HomeViewtest: CustomViewTests {

    func testInitByCoder() {
        expectFatalError(expectedMessage: "init(coder:) has not been implemented") {
            _ = HomeView(coder: NSCoder())
        }
    }
    
    override func customView() -> UIView {
        let view = HomeView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 70)
        
        XCTAssertEqual(view, view.activityIndicatorView.superview)
        XCTAssertEqual(view, view.tableView.superview)
        
        return view
    }
}
