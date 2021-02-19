//
//  FakeHomeViewModel.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
@testable import GitCommits

class FakeHomeViewModel: HomeViewModel_Protocol {
    
    var commits: [CommitInfo] = Resources.commits()
    var delegate: HomeViewModelDelegate?
    var getCommits_wasCalled = false
    func getCommits() {
        delegate?.startLoading()
        getCommits_wasCalled = true
    }
}
