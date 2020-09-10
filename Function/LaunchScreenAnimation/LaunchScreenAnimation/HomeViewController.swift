//
//  HomeViewController.swift
//  LaunchScreenAnimation
//
//  Created by 이재용 on 2020/09/08.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "Hello!"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.center = view.center
        view.backgroundColor = .systemBackground
        
    }
}
