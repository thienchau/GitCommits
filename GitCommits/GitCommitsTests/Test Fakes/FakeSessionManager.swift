//
//  FakeSessionManager.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
import Alamofire
@testable import GitCommits

class FakeSessionManager: SessionManager_Protocol {
    
    var request_wasCalled = false
    var request_wasCalled_withRequest: URLRequestConvertible?
    var request_stubbed: AFDataResponse<Data>!
    func request(_ request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<Data>) -> Void) {
        request_wasCalled = true
        request_wasCalled_withRequest = request
        completionHandler(request_stubbed)
    }
}
