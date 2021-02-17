//
//  ViewController.swift
//  GitCommits
//
//  Created by Duy Thien Chau on 2/17/21.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GitService().getRecentCommits { result in
            switch result {
            case let .success(commits):
                print(commits)
            case let .failure(error):
               print(error)
            }
        }
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .red
    }


}

