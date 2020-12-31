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
import RealmSwift

class StrokeListViewController: UIViewController {
    
    var strokeResultList: Results<StrokeFortuneResult>?
    let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "保存一覧"
        loadData()
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        loadData()
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
        return strokeResultList?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StrokeListTableViewCell", for: indexPath) as? StrokeListTableViewCell else {
            return UITableViewCell()
        }
        cell.cosmosView.rating = strokeResultList?[indexPath.row].rate ?? 0
        cell.nameLabel.text = strokeResultList?[indexPath.row].stroke?.name
        cell.strokeCountLabel.text = String(strokeResultList?[indexPath.row].stroke?.count ?? 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension StrokeListViewController: UITableViewDelegate {
    
    func loadData() {
        strokeResultList = realm.objects(StrokeFortuneResult.self)
        tableView.reloadData()
    }
    
    
    func deleteRealmfile(){
        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
        let realmURLs = [
            realmURL,
            realmURL.appendingPathExtension("lock"),
            realmURL.appendingPathExtension("note"),
            realmURL.appendingPathExtension("management")
        ]
        for URL in realmURLs {
            do {
                try FileManager.default.removeItem(at: URL)
            } catch {
                // handle error
            }
        }
    }
}
