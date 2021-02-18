//
//  FakeHomeViewModelDelegate.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation

class FakeHomeViewModelDelegate: HomeViewModelDelegate {
    
    var startLoading_wasCalled = false
    var loadCompleted_wasCalled = false
    var loadError_wasCalled_withError: Error?
    
    func startLoading() {
        startLoading_wasCalled = true
    }
    
    func loadDataComplete() {
        loadCompleted_wasCalled = true
    }
    
    func loadDataError(error: Error) {
        loadError_wasCalled_withError = error
    }
}
