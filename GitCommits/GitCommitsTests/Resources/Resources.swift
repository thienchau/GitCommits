//
//  Resources.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
@testable import GitCommits

class Resources {
    
    class func data(forJson name: String) -> Data {
        let bundle = Bundle(for: self)
        let url = bundle.url(forResource: name, withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    class func validCommit() -> CommitInfo {
        return CommitInfo(sha: "abc", commit: Commit(author: Author(name: "Tom"), message: "Update version 1"))
    }
    
    class func commits() -> [CommitInfo] {
        return [
            CommitInfo(sha: "abc", commit: Commit(author: Author(name: "Tom"), message: "Update version 1")),
            CommitInfo(sha: "def", commit: Commit(author: Author(name: "Marry"), message: "Change UI view"))
        ]
    }
}
