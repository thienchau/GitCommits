//
//  CustomViewTests.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest

@testable import GitCommits

class CustomViewTests: XCTestCase {
    
    var autoCloseTime: TimeInterval = 3
    var expectTime: TimeInterval = 5
    
    var viewController: UIViewController!
    var exp: XCTestExpectation!
    var button: UIButton!

    override func setUp() {
        super.setUp()
        viewController = UIViewController()
        viewController.view.backgroundColor = .white
        let screenSize = UIScreen.main.bounds
        button = UIButton(frame: CGRect(x: (screenSize.width - 200) / 2, y: screenSize.height - 70, width: 200, height: 45))
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .gray
    }
    
    @objc func buttonTap(sender: AnyObject) {
        exp.fulfill()
    }
    
    func customView() -> UIView {
        return UIView()
    }

    func testCustomUI() {
        UIApplication.shared.keyWindow?.rootViewController = viewController

        viewController.view.addSubview(customView())
        viewController.view.addSubview(button)
        
        exp = expectation(description: "wait to see UI")

        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        
        // This case is for CI test
        DispatchQueue.main.asyncAfter(deadline: .now() + autoCloseTime) { [weak self] in
            self?.button.sendActions(for: .touchUpInside)
        }
        
        // wait for tapping on button
        waitForExpectations(timeout: expectTime)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
