//
//  HTTPResponseHandler.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import Foundation
import Alamofire

protocol HTTPResponseHandler_Protocol {
    func handle(dataResponse: AFDataResponse<Data>) -> Result<Data, Error>
}

struct HTTPResponseHandler: HTTPResponseHandler_Protocol {
    func handle(dataResponse: AFDataResponse<Data>) -> Result<Data, Error> {
        if let error = dataResponse.error {
            return .failure(error)
        } else if let statusCode = dataResponse.response?.statusCode, statusCode >= 400 {
            return .failure(HTTPError.statusCode(statusCode))
        } else if let data = dataResponse.data {
            return .success(data)
        } else {
            return .failure(HTTPError.emptyResponse)
        }
    }
}
