//
//  ApiConstants.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import Foundation

struct ApiConstants {
    
    static let baseUrl = URL(string: "https://api.github.com")!
    
    static func commitsURL(user: String = "alamofire", repo: String = "alamofire", perPage: Int = 25) -> URL {
        let commitURLString = "\(baseUrl)/repos/\(user)/\(repo)/commits?per_page=\(perPage)"
        return URL(string: commitURLString)!
    }
}
