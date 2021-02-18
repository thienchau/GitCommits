//
//  Result_Testing.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
import Alamofire

extension Result {
    var isFailure: Bool {
        switch self {
        case .failure: return true
        case .success: return false
        }
    }
    
    func getFailure<E: Error>() -> E? {
        guard case let .failure(error) = self else {
            return nil
        }
        return error as? E
    }
}
