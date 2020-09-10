//
//  NextViewController.swift
//  LoadingProject
//
//  Created by 이재용 on 2020/09/08.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    lazy var activityIndicator: UIActivityIndicatorView = { // Create an indicator.
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        activityIndicator.center = self.view.center
        activityIndicator.color = .black
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator

    }()

//    lazy var button: UIButton = { // Create a button.
//        let button = UIButton(frame: CGRect(x:0, y:0, width:60, height:60))
//        button.backgroundColor = UIColor.red
//        button.layer.masksToBounds = true
//        button.layer.cornerRadius = 30.0
//        button.setTitle("Stop", for: .normal)
//        button.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-50)
//        button.addTarget(self, action: #selector(onClickButton(sender:)), for: .touchUpInside)
//        return button
//
//    }()

//    @objc func onClickButton(sender: UIButton){
//        if self.activityIndicator.isAnimating {
//            self.activityIndicator.stopAnimating()
//            self.button.setTitle("Start", for: .normal)
//            self.button.backgroundColor = UIColor.blue
//
//        } else {
//            self.activityIndicator.startAnimating()
//            self.button.setTitle("Stop", for: .normal)
//            self.button.backgroundColor = UIColor.red
//        }
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.activityIndicator) // Add UIButton on view
//        self.view.addSubview(self.button)

    }
    
    @IBAction func goToThird(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else { return }
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.modalTransitionStyle = .crossDissolve
            self.present(nextVC, animated: true) {
                
            }
        }
    }
    
    
}
