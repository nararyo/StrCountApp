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
import RealmSwift

class ResultViewController: UIViewController {
    
    var strokeFortuneResult: StrokeFortuneResult?
    var name: String?
    let realm = try! Realm()
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var describeLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentsPosition()
        setContentsProperty()
        setValueToContents()
        setAnimation()
    }

    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popViewController(animated: false)
    }

    @IBAction func saveButton(_ sender: Any) {
        saveData()
        doneAlert()
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ResultViewController {
    
    func saveData(){
        do {
            try realm.write{
                guard let result = strokeFortuneResult else {
                    return
                }
                realm.add(result)
            }
        }catch {
            print("エラー")
        }
    }
    
    func setContentsPosition(){
        
        scrollView.snp.makeConstraints{(make) -> Void in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{(make) -> Void in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(self.view.frame.width)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.view.bounds.height * 1.3)
            //make.height.equalTo(scrollView.contentLayoutGuide)
        }
        
        nameLabel.snp.makeConstraints{(make)-> Void in
            make.top.equalToSuperview().offset(36)
            make.height.equalTo(116)
            make.width.equalToSuperview().inset(12)
            make.centerX.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(nameLabel.snp.bottom).offset(64)
            
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
    }
    
    func setContentsProperty(){
        contentView.layer.cornerRadius = 5
        nameLabel.layer.cornerRadius = 5
        cosmosView.settings.totalStars = Int(strokeFortuneResult?.rate ?? 1)
        
        saveButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        saveButton.layer.shadowOpacity = 0.3
        saveButton.layer.shadowColor = UIColor.black.cgColor
        saveButton.layer.cornerRadius = 30
        
        backButton.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        backButton.layer.shadowOpacity = 0.3
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.cornerRadius = 30
        
        
    }
    
    func setValueToContents(){
        nameLabel.text = strokeFortuneResult?.stroke?.name
        countLabel.text = String(strokeFortuneResult?.stroke?.count ?? 0)
        cosmosView.rating = strokeFortuneResult?.rate ?? 0
        describeLabel.text = strokeFortuneResult?.describe
    }
    
    func setAnimation(){
        cosmosView.alpha = 0.0
        countLabel.alpha = 0.0
        describeLabel.alpha = 0.0
        //backButton.alpha = 0.0
        //saveButton.alpha = 0.0
        
        UIView.animate(withDuration: 2.0, delay: 0.8, options: [.curveEaseIn], animations: {
            self.cosmosView.alpha = 1.0
            self.countLabel.alpha = 1.0
            self.describeLabel.alpha = 1.0
            //self.backButton.alpha = 1.0
            //self.saveButton.alpha = 1.0
            
        }, completion: nil)
    }
    
    func doneAlert(){
        let alertController = UIAlertController.init(title: "登録完了", message: "保存しました", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) -> Void in
            alertController.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
}
