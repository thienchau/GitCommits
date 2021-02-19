//
//  HomeViewModelTest.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import XCTest
@testable import GitCommits

class HomeViewModelTest: XCTestCase {

    var subject: HomeViewModel_Protocol!
    var gitService: FakeGitService!
    var delegate: FakeHomeViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        gitService = FakeGitService()
        delegate = FakeHomeViewModelDelegate()
        subject = HomeViewModel(gitService: gitService)
        subject.delegate = delegate
    }

    func testGetCommits_Loading() {
        subject.getCommits()
        XCTAssertTrue(delegate.startLoading_wasCalled)
    }
    
    func testGetCommits_Failed() {
        subject.getCommits()
        gitService.getCommits_wasCalled_withCompletion?(.failure(HTTPError.emptyResponse))
        XCTAssertTrue(delegate.loadError_wasCalled_withError?.localizedDescription == HTTPError.emptyResponse.localizedDescription)
    }
    
    func testGetCommits_Success() {
        subject.getCommits()
        gitService.getCommits_wasCalled_withCompletion?(.success(Resources.commits()))
        XCTAssertTrue(delegate.loadCompleted_wasCalled)
        XCTAssertEqual(subject.commits, Resources.commits())
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
