//
//  StrokeListTableViewCell.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/26.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit
import Cosmos

class StrokeListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cosmosView: CosmosView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var strokeCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
