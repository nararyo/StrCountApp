//
//  ResultViewController.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/19.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit
import Cosmos
import SnapKit

class ResultViewController: UIViewController {
    
    var resultStrNumber: StrokeNumber?
    var name: String?
    
    
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var describeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewPosition()
        cosmosView.rating = Double(resultStrNumber?.rate ?? 0)
        describeLabel.text = resultStrNumber?.describe
        setAnimation()
    }


   
}

extension ResultViewController {
    
    func setViewPosition(){
        
//        let tabHeight = tabBarController?.tabBar.frame.size.height
//        let navHeight = navigationController?.navigationBar.frame.size.height
//        let height = self.view.bounds.height - (tabHeight! + navHeight!)
//        print(self.view.frame.height)
//        print(height)
//        print(tabHeight)
//        print(navHeight)
//        print(self.view.snp.top)
        
        nameLabel.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(self.view.snp.top).offset(self.view.bounds.height / 5)
        }
        
        countLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(nameLabel.snp.bottom).offset(108)
        }
        cosmosView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.countLabel.snp.bottom).offset(36)
        }
        describeLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.cosmosView.snp.bottom).offset(36)
            make.right.left.equalToSuperview().inset(16)
        }
    }
    
    func setAnimation(){
        cosmosView.alpha = 0.0
        countLabel.alpha = 0.0
        describeLabel.alpha = 0.0
        UIView.animate(withDuration: 2.0, delay: 0.6, options: [.curveEaseIn], animations: {
            self.cosmosView.alpha = 1.0
            self.countLabel.alpha = 1.0
            self.describeLabel.alpha = 1.0
        }, completion: nil)
    }
}
