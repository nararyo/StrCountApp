//
//  StrokeLogViewController.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/16.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit
import SnapKit
import Cosmos

class StrokeListViewController: UIViewController {
    
    var strokeResultList :[String] = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "保存一覧"
        setUpTableView()
        
    }
    
}

extension StrokeListViewController {
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "StrokeListTableViewCell", bundle: nil), forCellReuseIdentifier: "StrokeListTableViewCell")
        
    }
    
}

extension StrokeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //strokeResultList.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StrokeListTableViewCell", for: indexPath) as? StrokeListTableViewCell else {
            return UITableViewCell()
        }
        cell.cosmosView.rating = 3
        cell.nameLabel.text = "test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension StrokeListViewController: UITableViewDelegate {
    
}
