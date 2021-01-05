//
//  SettingTableViewController.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/31.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
        
    var isLowerCaseRecognaized: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
    }
    
    //設定画面から他の画面に遷移するときの処理
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        let userDefault = UserDefaults.standard
        userDefault.set(isLowerCaseRecognaized, forKey: "isLowerCaseRecognized")
        
        //タブバーで他の画面に遷移した時もHomeVCに戻れるようにする
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else{
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "アルファベットのカウント設定"
    }
}

extension SettingTableViewController: SettingTableViewCellDelegate {
    
    func sendSwitchValue(_ isLowerCaseRecognaized: Bool) {
        print(isLowerCaseRecognaized)
        self.isLowerCaseRecognaized = isLowerCaseRecognaized
    }
}
