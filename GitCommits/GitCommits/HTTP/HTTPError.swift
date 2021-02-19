//
//  HTTPError.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import Foundation

enum HTTPError: Error, Equatable {
    case statusCode(Int)
    case emptyResponse
}

