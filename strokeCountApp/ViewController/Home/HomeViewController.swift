//
//  HomeViewController.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/16.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
        
    }

}

extension HomeViewController {
    
    func setLayout() {
        imageView.snp.makeConstraints{(make) -> Void in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(232)
            make.top.equalTo(self.view.snp.top).offset(self.view.frame.height / 5)
            make.right.left.equalTo(self.view)
        }
        
        nameTextField.snp.makeConstraints{(make) -> Void in
            make.bottom.equalTo(imageView.snp.bottom).offset(-80)
        }
    }
}
