//
//  ViewController.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var alertPresenter: AlertPresenter_Protocol
    private var viewModel: HomeViewModel_Protocol
    
    lazy var homeView: HomeView = {
        let view = HomeView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        return view
    }()
    
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
        view = homeView
    }
}

// MARK: - HomeViewModelDelegate

extension HomeViewController: HomeViewModelDelegate {
    
    func startLoading() {
        homeView.activityIndicatorView.startAnimating()
        homeView.tableView.isHidden = true
    }
    
    func loadDataComplete() {
        homeView.activityIndicatorView.stopAnimating()
        homeView.tableView.isHidden = false
        homeView.tableView.reloadData()
    }
    
    func loadDataError(error: Error) {
        homeView.activityIndicatorView.stopAnimating()
        alertPresenter.present(from: self,
                               title: NSLocalizedString("Unexpected Error", comment: ""),
                               message: "\(error)",
                               dismissButtonTitle: NSLocalizedString("OK", comment: ""), handler: nil)
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommitCell.identifier, for: indexPath) as! CommitCell
        cell.selectionStyle = .none
        cell.configure(commitInfo: viewModel.commits[indexPath.row])
        return cell
    }
}

