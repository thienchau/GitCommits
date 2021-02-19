//
//  FakeCommitCellView.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
@testable import GitCommits

class FakeCommitCellView: CommitCellView {
    
    var configure_wasCalledWithParam: CommitInfo?
    var clearUI_wasCalled = false
    
    override func configure(commitInfo: CommitInfo) {
        configure_wasCalledWithParam = commitInfo
    }
    
    override func clearUI() {
        clearUI_wasCalled = true
    }
}
