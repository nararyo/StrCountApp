//
//  StrokeDetailViewController.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/26.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit
import Cosmos
import SnapKit

class StrokeDetailViewController: UIViewController {

    var result: StrokeFortuneResult?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var strokeCountLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        contentView.layer.cornerRadius = 5
        nameLabel.text = result?.stroke?.name
        strokeCountLabel.text = "\(String(result?.stroke?.count ?? 0))画"
        cosmosView.rating = result?.rate ?? 0
        descriptionLabel.text = result?.describe
    }
}

extension StrokeDetailViewController {
    
    func setLayout(){
        scrollView.snp.makeConstraints{(make) -> Void in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{(make) -> Void in
            make.edges.equalTo(scrollView.contentLayoutGuide).inset(12)
            make.width.equalTo(self.view.frame.width - 24)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.view.frame.height)
        }
        
    }
}
