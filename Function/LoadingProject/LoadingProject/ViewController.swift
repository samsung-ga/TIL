//
//  ViewController.swift
//  LoadingProject
//
//  Created by 이재용 on 2020/09/07.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        
    }
    
    @IBAction func goToNextPage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "NextViewController") as? NextViewController else { return }
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.modalTransitionStyle = .crossDissolve
            self.present(nextVC, animated: true)
        }
    }
    
    @IBAction func buttonTapped() {
        
        spinner.stopAnimating()
    }
    
//    private func getSeverData(completion: ) {
//        print("HI")
//    }

}

