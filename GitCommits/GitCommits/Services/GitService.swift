//
//  GitService.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import Foundation
import Alamofire

// MARK: - GitService_Protocol

protocol GitService_Protocol {
    func getRecentCommits(completion: @escaping (Result<[CommitInfo], Error>) -> Void)
}

// MARK: - GitService

class GitService: GitService_Protocol {
    
    private let httpClient: HTTPClient_Protocol
    private let jsonDecoder: JSONDecoder

    init(httpClient: HTTPClient_Protocol = HTTPClient()) {
        self.httpClient = httpClient
        self.jsonDecoder = JSONDecoder()
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func getRecentCommits(completion: @escaping (Result<[CommitInfo], Error>) -> Void) {
        let request = HTTPRequest(url: ApiConstants.commitsURL())
        
        httpClient.send(request: request) { result in
            switch result {
            case let .success(value):
                completion(Result(catching: { try self.jsonDecoder.decode([CommitInfo].self, from: value)}))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
