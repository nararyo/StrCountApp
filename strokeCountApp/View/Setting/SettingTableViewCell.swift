//
//  SettingTableViewCell.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/31.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

protocol SettingTableViewCellDelegate {
    
    func sendSwitchValue(_ isLowerCaseRecognaized: Bool)
}

class SettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var alphabetSwitch: UISwitch!
    //var isRecognizedLowerCase: Bool?
    var delegate: SettingTableViewCellDelegate?
    @IBOutlet weak var alphabetSwitchLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func valueChanged(_ sender: Any) {
        self.delegate?.sendSwitchValue(alphabetSwitch.isOn)
        setSwitchLabel(alphabetSwitch.isOn)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SettingTableViewCell {
    
    func setSwitchLabel(_ isRowerCaseRecognized: Bool) {
        if isRowerCaseRecognized == true {
            alphabetSwitchLabel.text = "大文字・小文字を区別する"
        }else {
            alphabetSwitchLabel.text = "大文字・小文字を区別しない"
        }
    }
}
