//
//  HomeViewModel.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import Foundation

// MARK: - HomeViewModelProtocol

protocol HomeViewModel_Protocol {
    // commits
    var commits: [CommitInfo] { get }
    // delegate
    var delegate: HomeViewModelDelegate? { get set }
    // get commits
    func getCommits()
}

// MARK: - HomeViewModelDelegate

protocol HomeViewModelDelegate: AnyObject {
    func startLoading()
    func loadDataComplete()
    func loadDataError(error: Error)
}

// MARK: - HomeViewModel

final class HomeViewModel: HomeViewModel_Protocol {
    
    var commits = [CommitInfo]()
    private let gitService: GitService_Protocol
    
    weak var delegate: HomeViewModelDelegate?
    
    init(gitService: GitService_Protocol = GitService()) {
        self.gitService = gitService
    }
    
    func getCommits() {
        delegate?.startLoading()
        gitService.getRecentCommits { result in
            switch result {
            case let .success(commits):
                self.commits = commits
                self.delegate?.loadDataComplete()
            case let .failure(error):
                self.delegate?.loadDataError(error: error)
            }
        }
    }
}


