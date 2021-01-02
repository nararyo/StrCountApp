//
//  SettingTableViewCell.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/31.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

protocol SettingTableViewCellDelegate {
    
    func switchChanged(_ isLowerCaseRecognaized: Bool)
}

class SettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var alphabetSwitch: UISwitch!
    //var isRecognizedLowerCase: Bool?
    var delegate: SettingTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let switchValue = UserDefaults.standard.value(forKey: "isLowerCaseRecognized") as? Bool{
            alphabetSwitch.isOn = switchValue
        }
    }
    
    
    @IBAction func valueChanged(_ sender: Any) {
        self.delegate?.switchChanged(alphabetSwitch.isOn)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
