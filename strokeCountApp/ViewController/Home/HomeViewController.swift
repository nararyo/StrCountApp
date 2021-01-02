//
//  HomeViewController.swift
//  strokeCountApp
//
//  Created by NR on 2020/12/16.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var validateMessageLabel: UILabel!
    
    @IBOutlet weak var toResultButton: UIButton!
    
    var strokeFortuneDataArray = [StrokeFortuneData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "アカウントID画数占い"
        setLayout()
        setUpTextField()
        setNavigationItem()
        buttonView()
        loadFortune()
        
        
    }

    
    @IBAction func ToResultButton(_ sender: Any) {
        
        let alphabetStandard = UserDefaults.standard.value(forKey: "isLowerCaseRecognized") as? Bool ?? true
            
        let vc = ResultViewController()
        let stroke = Stroke(name: nameTextField.text ?? "", isLowerCaseRecognized: alphabetStandard )
        vc.strokeFortuneResult = StrokeFortuneResult(stroke: stroke, strokeFortuneData: strokeFortuneDataArray[stroke.count ?? 0])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController {
    
    func setUpTextField() {
        nameTextField.delegate = self
    }
    
    @objc func moveSettingVC(){
        print(#function)
        let vc = SettingTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setNavigationItem() {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(moveSettingVC), for: .touchUpInside)
        button.setTitle("設定", for: .normal)
        let item = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = item
        
    }
    
    func buttonView(){
        toResultButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        toResultButton.layer.shadowOpacity = 0.5
        toResultButton.layer.shadowColor = UIColor.black.cgColor
    }
    
    func setLayout() {
        print(self.view.snp.top)
        imageView.snp.makeConstraints{(make) -> Void in
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(232)
            make.top.equalTo(self.view.snp.top).offset(self.view.frame.height / 5)
            make.right.left.equalTo(self.view)
        }
        
        nameTextField.snp.makeConstraints{(make) -> Void in
            make.bottom.equalTo(imageView.snp.bottom).offset(-80)
        }
    }
    
    //画数毎の結果一覧csvを読み込む
    func loadFortune(){
        guard let csvFilePath = Bundle.main.path(forResource: "fortune2", ofType: "csv") else {
            print("ファイルが存在しません")
            return
        }
        
        do {
            let csvStringData =  try String(contentsOfFile:csvFilePath, encoding: String.Encoding.utf8)
            csvStringData.enumerateLines(invoking: {(line, stop) in
                let strokeNumberSourceArray = line.components(separatedBy: ",")
                let strokeFortuneData = StrokeFortuneData(strokeNumberSourceArray: strokeNumberSourceArray)
                self.strokeFortuneDataArray.append(strokeFortuneData)
            })
        }catch {
            print("csvインポートエラー")
        }
    }
    
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        validateMessageLabel.textColor = .red
        if nameTextField.text?.isValid(.alphanumeric) ?? false {
            validateMessageLabel.text = "正しいです"
            validateMessageLabel.textColor = .blue
            //toResultButton.isHidden = false
            toResultButton.isEnabled = true
        }else {
            validateMessageLabel.text = "スペース・全角文字は判定できません"
            validateMessageLabel.textColor = .init(red: 255/255, green: 66/255, blue: 110/255, alpha: 1)
            //toResultButton.isHidden = true
            toResultButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}
