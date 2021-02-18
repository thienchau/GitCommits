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
}
