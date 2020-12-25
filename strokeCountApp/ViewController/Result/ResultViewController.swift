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
    
    var strokeFortuneResult: StrokeFortuneResult?
    var name: String?
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var describeLabel: UILabel!
    
    
    @IBOutlet weak var backButton: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewPosition()
        cosmosView.rating = strokeFortuneResult?.rate ?? 0
        describeLabel.text = strokeFortuneResult?.describe
        setAnimation()
    }


   
}

extension ResultViewController {
    
    func setViewPosition(){
        
        print(self.view.bounds.height)
        print(UIScreen.main.bounds.height)
        
        
        scrollView.snp.makeConstraints{(make) -> Void in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{(make) -> Void in
            make.width.equalTo(scrollView.frameLayoutGuide)
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.height.equalTo(self.view.bounds.height * 1.3)
        }
        
        nameLabel.snp.makeConstraints{(make)-> Void in
            make.top.equalToSuperview().offset(self.view.frame.height / 9)
            make.centerX.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(nameLabel.snp.bottom).offset(108)
            
            make.centerX.equalToSuperview()
        }
        cosmosView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.countLabel.snp.bottom).offset(36)
            make.centerX.equalToSuperview()
        }
        describeLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.cosmosView.snp.bottom).offset(36)
            make.right.left.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }
        
//        backButton.snp.makeConstraints{(make) -> Void in
//            make.bottom.equalTo(countLabel.snp.bottom).offset(208)
//
//        }
        
        print(contentView.bounds.height)
    }
    
    func setAnimation(){
        cosmosView.alpha = 0.0
        countLabel.alpha = 0.0
        describeLabel.alpha = 0.0
        //backButton.alpha = 0.0
        //saveButton.alpha = 0.0
        
        UIView.animate(withDuration: 2.0, delay: 0.6, options: [.curveEaseIn], animations: {
            self.cosmosView.alpha = 1.0
            self.countLabel.alpha = 1.0
            self.describeLabel.alpha = 1.0
            //self.backButton.alpha = 1.0
            //self.saveButton.alpha = 1.0
            
        }, completion: nil)
    }
}
