//
//  HomeScreenTests.swift
//  GitCommitsUITests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation

class HomeScreenTests: UITestBase {
    
    func testAppIsReady() throws {
        self.givenAppIsReady()
            .shouldSeeTheLatestCommit()
    }
    
}
