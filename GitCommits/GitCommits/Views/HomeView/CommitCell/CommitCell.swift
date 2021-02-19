//
//  CommitCell.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import UIKit

class CommitCell: UITableViewCell {
    
    lazy var commitCellView: CommitCellView = {
        let view = CommitCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func commonInit() {
        backgroundColor = .clear
        contentView.addSubview(commitCellView)
        NSLayoutConstraint.activate([
            commitCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            commitCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            commitCellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: commitCellView.bottomAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(commitInfo: CommitInfo) {
        commitCellView.configure(commitInfo: commitInfo)
    }
    
    override func prepareForReuse() {
        commitCellView.clearUI()
    }
    
    // identifier for reusing
    static var identifier: String {
        return String(describing: self)
    }

}
