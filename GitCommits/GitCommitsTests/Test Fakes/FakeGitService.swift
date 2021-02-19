//
//  FakeGitService.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
@testable import GitCommits

class FakeGitService: GitService_Protocol {
    
    var getCommits_wasCalled = false
    var getCommits_wasCalled_withCompletion: ((Result<[CommitInfo], Error>) -> Void)?
    
    func getRecentCommits(completion: @escaping (Result<[CommitInfo], Error>) -> Void) {
        getCommits_wasCalled = true
        getCommits_wasCalled_withCompletion = completion
    }
}
