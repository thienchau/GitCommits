//
//  HomeView.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import UIKit

class HomeView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(CommitCell.self, forCellReuseIdentifier: CommitCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.setContentHuggingPriority(.defaultLow, for: .vertical)
        tableView.isHidden = true
        return tableView
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        addSubview(tableView)
        addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: readableContentGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: readableContentGuide.bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
}
