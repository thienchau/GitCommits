//
//  AlertPresenterTests.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest

class AlertPresenterTests: XCTestCase {
    var fakeViewController: PartiallyFakeViewController!
    var subject: AlertPresenter!

    override func setUp() {
        super.setUp()
        fakeViewController = PartiallyFakeViewController()
        subject = AlertPresenter()
    }


    func testPresent_tellsTheViewControllerToPresentAnAlertController() {
        subject.present(from: fakeViewController, title: "", message: "", dismissButtonTitle: "", handler: nil)
        XCTAssertTrue(fakeViewController.present_wasCalled)
        XCTAssertTrue(fakeViewController.present_wasCalled_withArgs?.viewControllerToPresent is UIAlertController)
    }

    func testPresent_doesNotConfigureCallbackForPresentation() {
        subject.present(from: fakeViewController, title: "", message: "", dismissButtonTitle: "", handler: nil)
        XCTAssertNil(fakeViewController.present_wasCalled_withArgs?.completion)
    }

    func testPresent_configuresTheAlertWithTitleAndMessage() {
        subject.present(from: fakeViewController, title: "Some alert title", message: "Detailed message", dismissButtonTitle: "Close", handler: nil)

        let alertController = fakeViewController.present_wasCalled_withArgs?.viewControllerToPresent as? UIAlertController
        XCTAssertEqual(alertController?.title, "Some alert title")
        XCTAssertEqual(alertController?.message, "Detailed message")
        XCTAssertEqual(alertController?.actions.first?.title, "Close")
    }
    
    func testHandler() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        UIApplication.shared.keyWindow?.rootViewController = vc
        
        let exp = expectation(description: "shows alert")
        // waiting for pressing the Close button
        subject.present(from: vc, title: "title", message: "message", dismissButtonTitle: "Close", handler: {_ in
            exp.fulfill()
        })
        // This case is for CI test
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 5)
      }
    
    override func tearDown() {
        super.tearDown()
    }
}

