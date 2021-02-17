//
//  Commit.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import Foundation

struct CommitInfo: Equatable, Decodable {
    
    let sha: String
    let commit: Commit
}

struct Commit: Equatable, Decodable {
    
    let author: Author
    let message: String
}

struct Author: Equatable, Decodable {
    
    let name: String
}
