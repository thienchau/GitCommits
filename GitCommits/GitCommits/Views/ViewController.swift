//
//  ViewController.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import UIKit

class ViewController: UIViewController {

    private var alertPresenter: AlertPresenter_Protocol
    private var viewModel: HomeViewModel_Protocol
    
    init(alertPresenter: AlertPresenter_Protocol = AlertPresenter(),
         viewModel: HomeViewModel_Protocol = HomeViewModel()) {
        self.alertPresenter = alertPresenter
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getCommits()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .red
    }
}

// MARK: - HomeViewModelDelegate

extension ViewController: HomeViewModelDelegate {
    
    func startLoading() {
        print("loading")
    }
    
    func loadDataComplete() {
        print(viewModel.commits)
    }
    
    func loadDataError(error: Error) {
        alertPresenter.present(from: self,
                               title: NSLocalizedString("Unexpected Error", comment: ""),
                               message: "\(error)",
                               dismissButtonTitle: NSLocalizedString("OK", comment: ""), handler: nil)
    }
    
}


