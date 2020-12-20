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
    
    var strokeNumberArray = [StrokeNumber]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "アカウントID画数占い"
        setLayout()
        loadFortune()
    }

    
    @IBAction func ToResultButton(_ sender: Any) {
        let vc = ResultViewController()
        vc.resultStrNumber = strokeNumberArray[3]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController {
    
    func setLayout() {
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
                let strokeNumber = StrokeNumber.init(strokeNumberSourceArray: strokeNumberSourceArray)
                self.strokeNumberArray.append(strokeNumber)
            })
        }catch {
            print("csvインポートエラー")
        }
    }
}
