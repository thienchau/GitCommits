//
//  HomeScreenSteps.swift
//  GitCommitsUITests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
import XCTest


extension HomeScreenTests {
    
    @discardableResult
    func givenAppIsReady() -> HomeScreenTests {
        XCTContext.runActivity(named: "Given App Is Ready ") { _ in
            XCTAsyncAssert(HomeScreenElements.firstSHALabel.element)
        }
        return self
    }
    
    @discardableResult
    func shouldSeeTheLatestCommit() -> HomeScreenTests {
        XCTContext.runActivity(named: "Commits Are Loaded ") { _ in
            XCTAsyncAssert(HomeScreenElements.firstSHALabel.element)
            XCTAsyncAssert(HomeScreenElements.firstAuthorLabel.element)
            captureScreenShot(name: "loadedCommits")
        }
        return self
    }
    
}
