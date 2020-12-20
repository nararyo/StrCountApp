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
    @IBOutlet weak var resultTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewPosition()
        cosmosView.rating = Double(resultStrNumber?.rate ?? 0)
        resultTextView.text = resultStrNumber?.describe
        setAnimation()
    }


   
}

extension ResultViewController {
    
    func setViewPosition(){
        nameLabel.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(self.view.snp.top).offset(self.view.frame.height / 6)
        }
        countLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(self.view.frame.height / 3)
        }
        cosmosView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.countLabel.snp.bottom).offset(32)
        }
        resultTextView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.cosmosView.snp.bottom).offset(32)
        }
    }
    
    func setAnimation(){
        cosmosView.alpha = 0.0
        countLabel.alpha = 0.0
        resultTextView.alpha = 0.0
        UIView.animate(withDuration: 2.0, delay: 0.6, options: [.curveEaseIn], animations: {
            self.cosmosView.alpha = 1.0
            self.countLabel.alpha = 1.0
            self.resultTextView.alpha = 1.0
        }, completion: nil)
    }
}
