//
//  FakeAlertPresenter.swift
//  GitCommitsTests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
import UIKit
@testable import GitCommits

class FakeAlertPresenter: AlertPresenter_Protocol {
    var present_wasCalled = false
    var present_wasCalled_withArgs: (from: UIViewController, title: String, message: String, dismissButtonTitle: String, handler: ((UIAlertAction) -> Void)?)? = nil

    func present(from: UIViewController, title: String, message: String, dismissButtonTitle: String, handler: ((UIAlertAction) -> Void)?) {
        present_wasCalled = true
        present_wasCalled_withArgs = (from: from, title: title, message: message, dismissButtonTitle: dismissButtonTitle, handler: handler)
    }
}
