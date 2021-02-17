//
//  HTTPClient.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import Foundation
import Alamofire

protocol HTTPClient_Protocol {
    func send(request: HTTPRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

class HTTPClient: HTTPClient_Protocol {
    private let manager: SessionManager_Protocol
    private let responseHandler: HTTPResponseHandler_Protocol
    
    init(manager: SessionManager_Protocol = Session.default,
         responseHandler: HTTPResponseHandler_Protocol = HTTPResponseHandler()) {
        self.manager = manager
        self.responseHandler = responseHandler
    }
    
    func send(request: HTTPRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        manager.request(request) { dataResponse in
            let result = self.responseHandler.handle(dataResponse: dataResponse)
            completion(result)
        }
    }
}

