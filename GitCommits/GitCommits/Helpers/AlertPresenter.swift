//
//  AlertPresenter.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import Foundation
import UIKit

// MARK: - AlertPresenter

protocol AlertPresenter_Protocol {
    func present(from: UIViewController, title: String, message: String, dismissButtonTitle: String, handler: ((UIAlertAction) -> Void)?)
}

class AlertPresenter: AlertPresenter_Protocol {
    func present(from: UIViewController, title: String, message: String, dismissButtonTitle: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: dismissButtonTitle, style: .default, handler: handler)
        alertController.addAction(alertAction)
        from.present(alertController, animated: true, completion: nil)
    }
}
