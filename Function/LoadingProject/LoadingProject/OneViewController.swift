//
//  OneViewController.swift
//  LoadingProject
//
//  Created by 이재용 on 2020/09/10.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicator.color = .black
        activityIndicator.center = self.view.center
        return activityIndicator
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
