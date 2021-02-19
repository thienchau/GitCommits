//
//  FakeHTTPResponseHandler.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
import Alamofire
@testable import GitCommits

class FakeHTTPResponseHandler: HTTPResponseHandler_Protocol {
    
    var handle_wasCalled = false
    var handle_wasCalled_withDataResponse: AFDataResponse<Data>?
    var handle_stubbed: Result<Data, Error>!
    func handle(dataResponse: AFDataResponse<Data>) -> Result<Data, Error> {
        handle_wasCalled = true
        handle_wasCalled_withDataResponse = dataResponse
        return handle_stubbed
    }
}
