//
//  CommitCellView.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import UIKit

class CommitCellView: UIView {
    
    let shaLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .shaFont
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.font = .authorFont
        label.numberOfLines = 1
        return label
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .messageFont
        label.numberOfLines = 0
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shaLabel, authorLabel, commentLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stackView
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
        backgroundColor = .clear
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: .cellPadding),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.cellPadding),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configure(commitInfo: CommitInfo) {
        shaLabel.text = commitInfo.sha
        authorLabel.text = commitInfo.commit.author.name
        commentLabel.text = commitInfo.commit.message
    }
    
    func clearUI() {
        shaLabel.text = nil
        authorLabel.text = nil
        commentLabel.text = nil
    }

}
