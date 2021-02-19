//
//  HomeViewControllerTest.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest
@testable import GitCommits

class HomeViewControllerTest: XCTestCase {

    var subject: HomeViewController!
    var alertPresenter: FakeAlertPresenter!
    var viewModel: FakeHomeViewModel!
    
    func testInitByCoder() {
        expectFatalError(expectedMessage: "init(coder:) has not been implemented") {
            _ = HomeViewController(coder: NSCoder())
        }
    }
    
    override func setUpWithError() throws {
        super.setUp()
        alertPresenter = FakeAlertPresenter()
        viewModel = FakeHomeViewModel()
        subject = HomeViewController(alertPresenter: alertPresenter, viewModel: viewModel)
        XCTAssertNotNil(subject.view)
    }
    
    func testHomeVC_HasTheCorrectView() {
        XCTAssertTrue(subject.view is HomeView)
    }

    func testHomeVC_callServicecommit() {
        XCTAssertTrue(viewModel.getCommits_wasCalled)
    }

    func testHomeVC_viewModelDelegate() {
        XCTAssertNotNil(viewModel.delegate as? HomeViewController)
    }

    func testHomeVC_loadingDisplay() {
        XCTAssertFalse(subject.homeView.activityIndicatorView.isHidden)
        XCTAssertTrue(subject.homeView.tableView.isHidden)
    }

    func testHomeVC_commitFail() {
        viewModel.delegate?.loadDataError(error: HTTPError.emptyResponse)

        XCTAssertTrue(subject.homeView.activityIndicatorView.isHidden)

        XCTAssertTrue(alertPresenter.present_wasCalled)
        let alertPresentationArguments = alertPresenter.present_wasCalled_withArgs
        XCTAssertEqual(alertPresentationArguments?.title, "Unexpected Error")
        XCTAssertEqual(alertPresentationArguments?.message, "emptyResponse")
        XCTAssertEqual(alertPresentationArguments?.dismissButtonTitle, "OK")
    }

    func testHomeVC_commitSucceed() {
        viewModel.delegate?.loadDataComplete()

        XCTAssertTrue(subject.homeView.activityIndicatorView.isHidden)
        XCTAssertFalse(subject.homeView.tableView.isHidden)
    }
    
    func testSelectionVC_Display() {
        UIApplication.shared.keyWindow?.rootViewController = HomeViewController()
        
        let exp = expectation(description: "wait to see UI")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 12)
    }
    

    override func tearDown() {
        super.tearDown()
    }
}
