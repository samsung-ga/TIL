//
//  ViewController.swift
//  splashTest
//
//  Created by 이재용 on 2020/09/08.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import UIKit
import GIFImageView

class ViewController: UIViewController {
    
    let splashView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))
        imageView.image = UIImage.animatedImage(named: "ios_inventory_loading")
        
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(splashView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.splashView.center = view.center
        
    }


}

