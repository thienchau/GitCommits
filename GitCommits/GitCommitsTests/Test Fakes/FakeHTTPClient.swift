//
//  FakeHTTPClient.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
import Alamofire
@testable import GitCommits

class FakeHTTPClient: HTTPClient_Protocol {
    
    var send_wasCalled = false
    var send_wasCalled_withRequest = [HTTPRequest]()
    var send_stubbed = [HTTPRequest: Result<Data, Error>]()
    func send(request: HTTPRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        send_wasCalled = true
        send_wasCalled_withRequest.append(request)
        completion(send_stubbed[request]!)
    }
    
    func send_wasCalled_with(request: HTTPRequest) -> Bool {
        return send_wasCalled_withRequest.contains(request)
    }
    
    func fake(request: HTTPRequest, with result: Result<Data, Error>) {
        send_stubbed[request] = result
    }
}
