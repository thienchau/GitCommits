//
//  FakeCommitCellView.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation

class FakeCommitCellView: CommitCellView {
    
    var configure_wasCalled = false
    var clearUI_wasCalled = false
    
    override func configure(commitInfo: CommitInfo) {
        configure_wasCalled = true
    }
    
    override func clearUI() {
        clearUI_wasCalled = true
    }
}
